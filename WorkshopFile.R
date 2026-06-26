#Brief Introduction to Importing a data
#BASE WAY TO IMPORT A CSV FILE 
#It is advisable to always save you dataset in the current working directory. By default R looks at your document folder
#To get you working directoty, run the code below:
getwd()

#DATA IMPORT TO R
#To read a csv file:
#R defaults dataset file format is .csv, so always save ur dataset in the csv format to avoid plenty coding.
data_csv <- read.csv("yourfilename.csv")

#To read an excel file, you first install the excel package then load it:
install.packages("readxl")
library(readxl)
data_excel <- read_excel("path/to/your/file.xlsx")

#1. INSTALLING THE NECCESSARY PACKAGES
#To install any package in R, you use the function install.packages("you add the package name")
install.packages("statease")
install.packages("gapminder")
install.packages("ggplot2")
#After installing the packages, you must always load them before you can use them in any session. you do that with the library() function.
library(statease)
library(gapminder)
data("gapminder")
library(ggplot2)

#2. INSPECT YOUR DATA
#head - by default, you get the first six rows but you can change it
head(gapminder)
head(gapminder, 20)

#str - it tells you the number of rows and columns, column names, data types. 
str(gapminder)

#dim - shows the number of rows and columns you are working with.
dim(gapminder)

#summary - gives you an statistical overview of your data
summary(gapminder)
summary(gapminder$lifeExp)
summary(gapminder$year)

#3. NORMALITY TEST
#To know the right test to run in your work, it is advisable to always test for normality to check if your data is evenly distributed. This helps you select whether to run a parametric (for normally distributed dataset) or non-parametric tests (for not normally distributed datasets) (You need to read more on them.)
#Once your data has been loaded you can use the R base to check for the normality by running the code below if your dataset is fewer than 5000 obs and works on numeric data types:
shapiro.test(gapminder$gdpPercap) #checks for the distribution of gdp.
#Interpreting the results: If p > 0.05 it means the data is approximately normally distributed (fail to reject normality). If p is less than or equal to 0.05 then your data is not normally distributed.
#Visualisation of your data is critical too and gives better overview of distribution than the p value because sample size affects the p value. To visualise it, we use the Q-Q plot or even a simple histogram:
hist(gapminder$lifeExp) #look at the bars and see how it is distributed.
qqnorm(gapminder$lifeExp)
qqline(gapminder$lifeExp, col = "red")
#If the points in the Q-Q plot lie close to the red line, the data is normally distributed and vice versa.

#If your obs is greater than 5000, then the Kolmogorov Smirnov test is best.
ks.test(gapminder$lifeExp, "pnorm") #the same interpretation for the pvalue applies.

#4. CHECKING FOR  MISSING VALUES
#Checking for missing values - If it returns true, it means there are missing data and false means, Clean dataset
any(is.na(gapminder))
#count total number of missing values
sum(is.na(gapminder))
#missing values per column
colSums(is.na(gapminder))
#qucik visual check of the entire dataset
summary(is.na(gapminder))
#checking for the exact location of the missing values - this will show you the row number and column number of the missing value.
which(is.na(gapminder), arr.ind = TRUE)

#5. FILTERING THE DATA WE WILL USE FOR THE PRACTICE
#Filter for Africa and Ghana
africa_data <- gapminder[gapminder$continent == "Africa", ]
asia_data <- gapminder[gapminder$continent == "Asia", ]
ghana_data <- gapminder[gapminder$country == "Ghana", ]

#Visualisation
#life expectancy over time in Ghana
ggplot(ghana_data, aes(x = year, y = lifeExp)) + geom_line(color = "green", linewidth = 1.5) + geom_point(color = "red", size = 3) + labs(title = "Life Expectancy in Ghana (1952-2007)", x = "Year", y = "Life Expectancy") + theme_minimal()

#6. INTRODUCING STATEASE - It runs your analysis and interprets your results.
#1. Descriptive - describe life expectancy in Africa
africa_data <- gapminder[gapminder$continent == "Africa" & gapminder$year == 2007, ]
result <- describe(africa_data$lifeExp, var_name = "LIfe Expectancy in Africa (2007)")
print(result)

#T-Test: T-test is used to determine if there is a significant difference between the means of two groups
#Do african and asian countries have different life expectancy in 2007?
asia_data <- gapminder[gapminder$continent == "Asia" & gapminder$year == 2007, ]
result <- ttest_interpret(africa_data$lifeExp, asia_data$lifeExp, var_name = "Life Expectancy: Africa vs Asia")
print(result)
#If your data is not normally distributed, the Mann-Whitney U test is the non-parametric alternative for T-test:
result5 <- mannwhitney_interpret(africa_data$lifeExp, asia_data$lifeExp, var_name = "Life Expectancy: Africa vs Asia")
print(result5)

#ANOVA - Comparing multiple groups
#Do continents differ in life expectancy in 2007?
data_2007 <- gapminder[gapminder$year == 2007, ]
result <- anova_interpret(lifeExp ~ continent, data = data_2007)
print(result)
#You can run the non-parametric alternative for ANOVA in statease if your data is not normally distributed.

#Correlation - checks for relationships between variables
#Is GDP per capita related to life expectancy?
result <- cor_interpret(data_2007$gdpPercap, data_2007$lifeExp, var1_name = "GDP per Capita", var2_name = "Life Expectancy")
print(result)
result3 <- cor_interpret(data_2007$gdpPercap, data_2007$lifeExp, var1_name = "GDP per Capita", var2_name = "Life Expectancy", method = "spearman")
print(result3)

#Regression
#Predicting Life Expectancy
#Can GDP per capita predict life expectancy?
result <- reg_interpret(lifeExp ~ gdpPercap, data = data_2007)
print(result)

#Multiple Linear Regression
result2 <- mlr_interpret(lifeExp ~ gdpPercap + pop, data = data_2007)
print(result2)

#The analyze() master function. It detects the right test!By default statease analyze() master function uses a parametric approach, so to run non-parametric test, you must force the backend to use the non-parametric approach by passing nonparam = TRUE.
#Descriptive
analyze(x = africa_data$lifeExp, var_name = "Life Expectancy")

#Auto T-Test
analyze(x = africa_data$lifeExp, y = asia_data$lifeExp)

#Auto ANOVA
analyze(formula = lifeExp ~ continent, data = data_2007)

#Auto regression
analyze(formula = lifeExp ~ gdpPercap, data = data_2007)

#Auto-nonparam
analyze(x = africa_data$lifeExp, y = asia_data$lifeExp, nonparam = TRUE)

#7. Introduction to Shiny App
#Shiny is an interactive web interface where you can still run your analyses without writing R codes. 
#Load the statease shiny App: https://devwebwacky.shinyapps.io/statease/
#You can use the statease shiny app via the link above.