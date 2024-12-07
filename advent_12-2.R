# library(tidyverse)
# #read lists in
# input <- read.csv('advent_input_12-2.csv')
# 
# #find difference between 2 lists smallest number, then next smallest, etc.
# 
# 
# asc_A <- input %>% 
#   arrange(A) #df arranged by A
# asc_B <- input %>% 
#   arrange(B) #df arranged by B
# 
# df_A <- asc_A %>% 
#   select(A) #extract sorted A column
# df_B <- asc_B %>% 
#   select(B) #extract sorted B column
# 
# #combine both sorted asc colummns into new doof
# df <- data.frame(A = df_A$A, B = df_B$B) 
# 
# num_rows = nrow(df)
# k=0
# for (i in 1:num_rows) {
#   j = abs(df[i,'A'] - df[i,'B'])
#   k = k+j
#   }
# 
# print(k)

##########################################################################################################
#Part 1
##########################################################################################################
library(tidyverse)

# Read the input CSV file
input <- read.csv('advent_input_12-2.csv')

# Sort columns A and B in ascending order and combine them into a new data frame
df <- data.frame(
  A = input %>% arrange(A) %>% pull(A),
  B = input %>% arrange(B) %>% pull(B)
)
# Calculate the sum of absolute differences between corresponding elements
result <- sum(abs(df$A - df$B))

print(result)

###########################################################################################
#Part 2
###########################################################################################
#Calculate a total similarity score by adding up each number in the left list 
#after multiplying it by the number of times that number appears in the right list.
library(tidyverse)

unique_A <- df %>% #figure out how many numbers in left list are unique
  pull(A) %>% 
  n_distinct()  

df$count_in_B <- sapply(df$A,function(x) sum(df$B == x))
result <- sum(df$A * df$count_in_B)
print(result)
