#FACILITATOR: UWAKMFON USEN PAUL, MLS
#Prepared for: 50 Days of Becoming A Data Scientist
#CONTACT: 0559872031
#EMAIL: Uwakmfon31@gmail.com | uwakmfon@ghana-rusers.org

#WHAT IS R?
#R is a programming language for data analysis and statistics. It is widely used in research, finance and health sciences.

#Why Learn R?
#a. Strong for statistics
#b. Huge package ecosystem
#c. Free and open source

#R vs Python
#R is excellent for statistics & Visualisation
#Python is a general purpose and ML language
#Both are Valuable

#Installing R & RStudio
#R is the engine or the programming language
#RStudio is the IDE where you write and run your R code

#RStudio Layout
#Script Panel
#Console
#Environment
#Plots/Files

#First Command
print("Hello, Ghana R")
"Hello, Ghana R"

2 + 2
print(2+2)

#Variable is a named container that stores a value. In R we assign values using the <- operator (preferred) or =

#Examples
name <- "Uwakmfon"
age <- 1
height <- 2.5

print(name)
name
print(age)
age
print(height)
height

#Always use <- for assignment in R. This is the community standard and avoids confusion with the = used in function arguments

#DATA TYPES
#1. Numeric: any number (integer or decimal)
#2. character: text (always wrap in quotes)
#3. logical: boolean values (all caps in R)

#Examples
x <- 1
y <- "Ghana R"
z <- TRUE
g <- "1"

class(x)
class(y)
class(z)
class(g)

#There is a difference between 1 (numeric) and "1" (character). Though they look similar, they act and behave differently.

#BASIC OPERATIONS
#1. Arithmetic

10 + 3
10 - 3
10 * 3
10 / 3
10 ^ 2

#2. Comparison Operators
5 > 3
5 < 3
5 == 5 

#3. String Operators
first <- "Ghana"
last <- "R Community"

paste(first, last)
paste0(first, last)
nchar(first)
nchar(last)

#COMMON MISTAKES
#1. Missing quotes
#2. using class as a variable name, class is an inbuilt R function
#3. Logicals must be fully uppercase.

#VECTORS: ordered collection of values of the same type. We use c() to create one. the c() means combine.
scores <- c(80, 90, 100)
names <- c("Uwakmfon", "Usen", "Paul")
tall <- c(TRUE, FALSE, FALSE)
#Check type of vector and length
class(scores)
class(names)
class(tall)
length(tall)

#Indexing: Indexing in R allows you to extract specific elements from a vector using square brackets [].
scores[1] #this will return the first value in that vectotr
scores[3] #this will give you the third value in that vector.
#To extract a range of values you run:
names[1:3]

#DATA FRAMES: A data frame is R's version of a spreadsheet table. it stores data in rows and columns just like a spreadsheet. 
#Once you import your well cleaned and structured data into R, it will automatically creat a dataframe for you.

#To access columns in a dataset, you use the $ operator to access it by name. It will return that column as a vector.

#NOTE: 
#1. DO NOT WRITE YOUR SCRIPTS IN THE CONSOLE.
#2. ALWAYS CREATE A NEW PROJECT AND FILES.
#3. MAKE SURE YOU ALWAYS SAVE AND RUN YOUR CODE. EVERYTHING SCRIPT YOU WRITE, MAKE SURE TO RUN IT SO AS TO SAVE IT TO R'S MEMORY.
