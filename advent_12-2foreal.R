library(tidyverse)
######### PART 1 #############
d2 <- read_lines('day2_input.txt')
str(d2)
?lapply
d2f <- lapply(str_split(d2, " "),as.numeric)

head(d2f)
glimpse(d2f)

# Function to check if a vector is in same direction and steps less than abs(3)
is_safe <- function(x) {
  d<-diff(x)
  if((all(d>=1) && all(d<=3)) || (all(d<=-1) && all(d>=-3))){d<-TRUE}
  else{d<-FALSE}
}

teach <- sapply(d2f,is_safe)
class(teach)
glimpse(teach)

part1 <- sum(sapply(d2f,is_safe))
print(part1)

###############################################################################
#Part 2
###############################################################################

is_very_safe <- function(x) {

  if(is_safe(x)){return(TRUE)} #check for safety and return TRUE
  dvs<-FALSE #Else set a new variable for the FALSE that need to be re-evaluated
  i <- 1
  
  while (!dvs && i <= length(x)){ #check safe by removing one index at a time, stop once safe or no more
    dvs <- is_safe(x[-i])
    i <- i+1
  }
  
return(dvs)}

# sapply(d2f,is_very_safe)

part2 <- sum(sapply(d2f,is_very_safe))
part2
