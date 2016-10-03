library("dplyr")
library("tidyr")

airline_df <- read.csv("Airline.csv")
airline_df[2,1] <- airline_df[1,1]
airline_df[4,1] <- airline_df[3,1]

names(airline_df)[1] <- "Airline"
names(airline_df)[2] <- "Status"
airline2_df <- airline_df %>%
                  gather("Location", "n",3:7)


# Filter observation by airline
alaska_df <- airline2_df %>% filter(Airline == "Alaska")
amwest_df <- airline2_df %>% filter(Airline == "AM West")

alaska_df




# On-time flights
ontime_df <-
  airline2_df %>%
  filter(Status == "on time") %>%
  select(-Status) %>%
  group_by(Location)

# Delayed flights
delayed_df <-
  airline2_df %>%
  filter(Status == "delayed") %>%
  select(-Status) %>%
  group_by(Location)
delayed_df
