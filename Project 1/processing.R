library(stringr)

tournament_file <- readLines(con <- file("tournamentinfo.txt"), warn = FALSE)
tournament_file <- tournament_file[-1]
tournament_file <- tournament_file[-1]
tournament_file <- tournament_file[-1]
tournament_file <- tournament_file[-1]
names_list <- vector()
states_list <- vector()
points_list <- vector()
old_rank_list <- vector()
new_rank_list <- vector()
matches_list <- vector()

# Parse file
for(index in 1:length(tournament_file))
{
  dedelimit_line <- strsplit(tournament_file[index], "\\|")
  dedelimit_line <- str_trim(dedelimit_line[[1]])
  str_trim(dedelimit_line)
  
  new_index <- ceiling(as.double(index) / 3)
  if(index %% 3 == 1)
  {
    names_list[new_index] <- dedelimit_line[2]
    points_list[new_index] <- dedelimit_line[3] 
    matches_list[new_index] <- list(dedelimit_line[4:10])
  }
  else if (index %% 3 == 2)
  {
    states_list[new_index] <- dedelimit_line[1]
    rank <- str_extract(dedelimit_line[2], "R:\\s+\\d+")
    old_rank_list[new_index] <- str_extract(rank, "\\d+")
  }
}


# Parse matches list to calculate new ranking
for(index in 1:length(names_list))
{
  wcount <- 0
  waccum <- 0 
  for(mindex in 1:7)
  {
    is_winner <- str_detect(matches_list[[index]][mindex], "W|D")[[1]]
    if(is_winner)
    {
      wcount <- wcount + 1;
      waccum <- waccum + as.integer(old_rank_list[as.integer(str_extract(matches_list[[index]][mindex], "\\d+"))])
    }
  }
  if(wcount > 0)
    new_rank_list[index] <- round(waccum / wcount)
  else
    new_rank_list[index] <- old_rank_list[index]
}

df <- data.frame(names_list,states_list,points_list,old_rank_list,new_rank_list)
write.csv(df, file = "tournament.csv", row.names = FALSE, quote=FALSE)

