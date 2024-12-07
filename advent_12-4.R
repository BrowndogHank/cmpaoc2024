#day4
#Find 
# ..X...
# .SAMX.
# .A..A.
# XMAS.S
# .X....


library(tidyverse)
d4 <- read_lines('day4_input.txt')
d4 <- data.frame(d4=d4)
?str_split_fixed
d4 <- str_split_fixed(d4$d4,"",nchar(d4[1,]))
class(d4)
dim(d4)

dd <- row(d4) - col(d4)
print(dd)
diag1 <- split(d4,dd) # split the column on the pattern of row - col, 0 down diag top left to bottom right
diag2 <- split(d4[nrow(d4):1, ],dd) #invert the matrix you are spliting, top right to bottom left


xmas <- NULL

for (i in 1:nrow(d4)){
  row_fwd <- str_extract_all(paste0(d4[i, ], collapse = ""), "XMAS", simplify = TRUE)
  row_rev <- str_extract_all(paste0(d4[i, ], collapse = ""), "SAMX", simplify = TRUE)
  col_fwd <- str_extract_all(paste0(d4[ ,i], collapse = ""), "XMAS", simplify = TRUE)
  col_rev <- str_extract_all(paste0(d4[ ,i], collapse = ""), "SAMX", simplify = TRUE)
  xmas <- c(xmas, row_fwd, row_rev, col_fwd, col_rev)
}
length(xmas)

for (i in 1:length(diag1)){
  diag1_fwd <- str_extract_all(paste0(diag1[[i]], collapse=""), "XMAS", simplify = TRUE)
  diag1_rev <- str_extract_all(paste0(diag1[[i]], collapse=""), "SAMX", simplify = TRUE)
  diag2_fwd <- str_extract_all(paste0(diag2[[i]], collapse=""), "XMAS", simplify = TRUE)
  diag2_rev <- str_extract_all(paste0(diag2[[i]], collapse=""), "SAMX", simplify = TRUE)
  xmas <- c(xmas, diag1_fwd, diag1_rev, diag2_fwd, diag2_rev)
}

length(xmas)

###############################################################################
#Part 2
###############################################################################
#Find X-MAS
# M.S
# .A.
# M.S

#group d4 into 3x3's d4[1:3,1:3]
#iterate over the groups of 3x3 matrices in d4
#top must be d[1,1]= M or S, d[1,3] = M or S
#middle must be 'A' d4[2,2]
#bottom must be d[1,1]= M or S, d[1,3] = M or S

# print(d4[1:3,1:3])
# print(d4[1:3,2:4])
# print(d4[1:3,3:5]).....to end of columns,
# then
# print(d4[2:4,1:3])
# print(d4[2:4,2:4])....to the end rows
  
xmas <-0
for (i in 1:(nrow(d4)-2)){
  for (j in 1:(ncol(d4)-2)){
    sub3 <- d4[i:(i+2),j:(j+2)] #slice out 3x3 to evaluate 
    if (sub3[2,2] == 'A'){ #center always needs to be a
        if( ((sub3[1,1] == 'M' && sub3[3,3] == 'S') && (sub3[3,1] == 'M' && sub3[1,3] == 'S')) || #Top left M, bottom right must b S, Bottom left M, top right must b S
            ((sub3[1,1] == 'S' && sub3[3,3] == 'M') && (sub3[3,1] == 'S' && sub3[1,3] == 'M')) || #Top left S, bottom right must b M, Bottom left S, top right must b M
            ((sub3[1,1] == 'M' && sub3[3,3] == 'S') && (sub3[3,1] == 'S' && sub3[1,3] == 'M')) || #Top left M, bottom right must b S, Bottom left S, top right must b M
            ((sub3[1,1] == 'S' && sub3[3,3] == 'M') && (sub3[3,1] == 'M' && sub3[1,3] == 'S'))){  #Top left S, bottom right must b M, Bottom left M, top right must b S
        # print('we got an X-MAS')
        xmas <- xmas+1 #if we get any of those combos we got an X-MAS count it
        }
      }
    }
  }
xmas

       