# Setup
library(stringr)
raw.data <-"555-1239Moe Szyslak(636) 555-0113Burns, C. Montgomery555-6542Rev. Timothy Lovejoy555 8904Ned Flanders636-555-3226Simpson, Homer5553642Dr. Julius Hibbert"
name <- unlist(str_extract_all(raw.data, "[[:alpha:]., ]{2,}"))

name_vector <- function(names_list)
{
  output_list <- vector(length(names_list)
  for(i in 1:length(name_list))
  {
    splitname <- str_split(names_list[i], " ")
    if(str_count(splitname[1], ",") == 0)
    {
      
    }
  }
  
}
# Remove title & initials
name_scrubbed <- str_replace(name, "[[:alpha:]]{1,3}\\.","")
name_scrubbed <- str_trim(name_scrubbed)

# Process the scrubbed name list
output_list <- vector(length(name_scrubbed))
for(i in 1:length(name_scrubbed))
{
  if(str_count(splitname[1], ",") == 0)
        output_list[i] <- c(splitname[1], " ", splitname[2])
  else
  {
    splitname[2] <- str_replace(splitname[2],",","")
    output_list[i] <- c(splitname[2], " ", splitname[1])
  }
}

print(output_list)


# Deterime if the person has a title
title <- str_detect(name, "[[:alpha:]]{2,3}\\.")



# Detect the second name
second_name <- str_count(name,  "[[:alpha:]., ]") == 3
second_name

test <- str_count(name[5],  )
test
name[5]


# Problem 4

# 1) matches a number of 1 or more digits, ending with a dollar sign
str1 <- "test214$555 65$  3456767$ $"
print(str_extract_all(str1, "[0-9]+\\$"))

# 2) \\b[a-z]{1,4}\\b is word of 1 to 4 lower-case characters

str2 <- "The boy walked the walk."
print(str_extract_all(str2, "\\b[a-z]{1,4}\\b"))

# 3) .*?\\.txt$ matches any number of characters, followed by ".txt" and it must be at the end of the line

str3a <- "test1.txt\n test2.txt"
str3b <- "hello3.txt"
print(str_extract_all(str3a, ".*?\\.txt$"))
print(str_extract_all(str3b, ".*?\\.txt$"))

# 4) \\d{2}/\\{2}/\\d{4} matches 2 digits / 2 digits / 4 digits,
# in the same way that the USA does month / day / year date format
str4 <- "99/99/9999 1/12/1111 12/1/1234 01/01/01 09/18/2016, a/wrong/example"
print(str_extract_all(str4, "\\d{2}/\\d{2}/\\d{4}"))

# 5) <(.+?)>.+?</\\1>
str5 <- "asdfasd sadfasdf /fasdfsd eafasdf /safasdfsdaf asdfasdf"
print(str_extract_all(str5, "<(.+?)>.+?</\\1>"))


str5 <- "<test>hello</test><test5>world</test5>"
print(str_extract_all(str5, "<(.+?)>.+?</\\1>"))


has_title <- str_detect(name, "[[:alpha:]]{2,3}\\.")
print(has_title)


split_names <- c(str_split(name, " "))
has_second <- (lengths(split_names) > 2) & !has_title


