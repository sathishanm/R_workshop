#extensive understanding of Dplyr
#understanding the following
#select,filter,mutate,arrange,summarise,chaining
#compare with Base R - Data Frames
#install.packages("dplyr")
#install.packages("hflights")
library(dplyr)
library(hflights)
data(hflights)
head(hflights)
flights<-hflights
#display
flights
#pretty print function - adjusts to window space available for 
#display - can select the number of rows to print

#select
select(flights, DepTime, ArrTime, FlightNum)
str(flights)
select(flights, Year:DepTime,TaxiIn)
#`starts_with`, `ends_with`, 
#and `matches` 
select(flights, starts_with("Dep"))
select(flights, ends_with("time"))
select(flights, matches("Dep"))

#names containing the one or more of the given letters
select(flights, matches("l|d"))
names(select(flights, matches("l|d")))
#names containing letters in the given range
select(flights, matches("[w-z]"))
names(select(flights, matches("[w-z]")))
#combination
select(flights, Year:DayofMonth, contains("Taxi"), contains("Delay"))

#chaining..basic usage
flights%>%select(matches("Delay"))
#lets build on it
flights%>%select(matches("Delay"))%>%filter(DepDelay>100)
#for a particular airline
flights%>%select(matches("Delay"),UniqueCarrier)%>%filter(DepDelay>100)

flights%>%select(matches("Delay"),UniqueCarrier)%>%
  filter(DepDelay>100)%>%
  filter(UniqueCarrier=="AA")

# select() can be used to rename columns for display
flights %>% select(Day = DayofMonth)



#Filtering data
filter(flights, Month==1, DayofMonth==1)
# use pipe for OR condition
filter(flights, UniqueCarrier=="AA" | UniqueCarrier=="UA")

# you can also use %in% operator
filter(flights, UniqueCarrier %in% c("AA", "UA"))

# between() is a concise alternative for determing if numeric values fall in a range
flights %>% filter(between(DepTime, 600, 605))

# side note: is.na() can also be useful when filtering
flights %>% filter(!is.na(DepTime))

# slice() filters rows by position
flights %>% slice(1000:nrow(flights) )









# unique rows can be identified using unique() from base R
flights %>% select(Origin, Dest) %>% unique()

# dplyr provides an alternative that is more "efficient"
#similar to select distinct in SQL
flights %>% select(Origin, Dest) %>% distinct()

#count distinct values
flights %>% select(Origin, Dest) %>% distinct()%>%nrow()
 
#class Exercise2
#How many Airlines are there in this data
head(flights)

#adding a new variable(column)
# base R approach to create a new variable Speed (in mph)
flights$Speed <- flights$Distance / flights$AirTime*60
flights[, c("Distance", "AirTime", "Speed")]

# dplyr approach (prints the new variable but does not store it)
flights %>%
  select(Distance, AirTime) %>%
  mutate(Speed = Distance/AirTime*60)
names(flights)

# store the new variable/structure of the data 
#fram is modified observe change in number of variables
#from 21 to 22 on the right
flights <- flights %>% mutate(Speed = Distance/AirTime*60)

#Arrange
flights %>% select(Origin, Dest) %>% arrange(Dest)
#Default is ascending order....
#for descending order
flights %>% select(Origin, Dest) %>% arrange(desc(Dest))
#multiple 
flights %>% select(Origin, Dest) %>% arrange(Dest,desc(Origin))

#summarise
#find the average delay by destination
flights %>%
  group_by(Dest) %>%
  summarize(avg_delay = mean(ArrDelay, na.rm=TRUE))

#lets cross check the number of destinations
flights %>% select(Dest) %>% distinct()%>%nrow()

#min and max delays along with average
flights %>%
  group_by(Dest) %>%
  summarise(avg_delay = mean(ArrDelay, na.rm=TRUE),
            mindelay = min(ArrDelay,na.rm=TRUE),
            maxdelay=max(ArrDelay,na.rm=TRUE))
mydf<-flights %>%
  group_by(Dest) %>%
  summarise(avg_delay = mean(ArrDelay, na.rm=TRUE),
            mindelay = min(ArrDelay,na.rm=TRUE),
            maxdelay=max(ArrDelay,na.rm=TRUE))

write.csv(mydf,"D:/MLwithR/consolidated/Day2/myreport1.csv")


#helper function n()
#count the number of flights per month
flights %>%
  group_by(Month) %>%
  summarise(flight_count = n())
# for each day of the year, 
#count the total number of flights and sort 
#in descending order - shows the month/day with 
#highest number of flights
flights %>%
  group_by(Month, DayofMonth) %>%
  summarise(flight_count = n()) %>%
  arrange(desc(flight_count))
#if you want to see the same info monthwise
flights %>%
  group_by(Month, DayofMonth) %>%
  summarise(flight_count = n()) %>%
  arrange(Month,DayofMonth)

#top_n() function very useful to check ranking
# for each carrier, calculate which two days of the year 
#they had their longest departure delays

flights %>%
  group_by(UniqueCarrier) %>%
  select(Month, DayofMonth, DepDelay) %>%
  top_n(2) %>%
  arrange(UniqueCarrier, desc(DepDelay))



#Joins
# data_frame() example
data_frame(a = 1:6, b = a*2, c = 'string', 'd+e' = 1) %>% glimpse()

# data.frame() example
data.frame(a = 1:6, c = 'string', 'd+e' = 1) %>% glimpse()

# create two simple data frames
(a <- data_frame(color = c("green","yellow","red"), num = 1:3))
(b <- data_frame(color = c("green","yellow","pink"), size = c("S","M","L")))
a
b
# only include observations found in both "a" and "b" (automatically joins on variables that appear in both tables)
inner_join(a, b)

# include observations found in either "a" or "b"
full_join(a, b)

# include all observations found in "a"
left_join(a, b)

# include all observations found in "b"
right_join(a, b)

# right_join(a, b) is identical to left_join(b, a) except for column ordering
left_join(b, a)





####End of Section
