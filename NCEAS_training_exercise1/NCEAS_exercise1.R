## Author: Scott Mortensen
## Date: 2017-07-18
## Title: NCEAS Training Exercise 1
## Subtitle: Reformatting a CSV to practice data wrangling

# Don't need: dest_file <- "https://nceas.github.io/datateam-training/training/introduction-to-open-science.html"
# Don't need: download.file(data, dest_file)

library(tidyverse)  #load library ##install.packages("tidyverse")  
getwd() #prints working directory

mydata <- read.csv ("https://nceas.github.io/datateam-training/training/data/Loranty_2016_Environ._Res._Lett._11_095008.csv", header=TRUE)
mydata #prints all of the csv ##head(mydata)  # prints first 6 lines of csv

str(mydata)
names(mydata) #column names
dim(mydata) #dim dimension (rows x columns)
ncol(mydata) #number of columns
nrow(mydata) #number of rows
summary(mydata) #statistical overview

#dplr stuff
## first argument is dataframe
## subsequent arguments describe what to do to dataframe, can refer to columns directly without $
filter() #pick observations by their values ## can use logical expressions (<,>,==,*, etc.)
select() #pick variables by their names
mutate() #create new variables with functions of existing variables, e.g. add a column
## mydata %>% mutate(index=1:nrow(mydata)) 
## mydata %>% mutate(gdp = pop*gdpPercap) ## gdp is the header name of the new column
## mydata %>% filter(country == "Vietnam") %>% 
  ## mutate(gdp = pop * gdpPercap, max_gdp = max(gdp)) #max function returns the highest value in GDP column
summarise() #collapse many values down to a single summary
arrange() #reorder rows

# %>% examples: pipe operator, think "and then"
## variable_name <- mydata %>% filter(country=="Cambodia")
## variable_name <- mydata %>% select (-continent, -lifeExp)

mydata <- read.csv ("https://nceas.github.io/datateam-training/training/data/Loranty_2016_Environ._Res._Lett._11_095008.csv", header=T, skip =2)
mydata #prints all of the csv ##head(mydata)  # prints first 6 lines of csv ##above line skips first two lines.
colnames(mydata) <- c("Aggregated Class", "GLC 2000 Class", "Area (km^2)", "Continuous Canopy Cover (%)", "Area (km^2)", "Discontinuous Canopy Cover (%)")
     ## The above line renames all of the column header names
mydata[mydata == (" ", "  ")] <- NA ## replaces empty spaces with "NA", can also use 0 instead of " "
mydata

mydata[,c(1:6)]
mydata_column_reorg <- mydata[,c(2,1,3:6)] ##reorganizes columns, 2nd column goes first, the rest follow.







