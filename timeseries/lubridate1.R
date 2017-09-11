# Package Lubridate
# Date Functions - Date & Time

#Eg1
library(lubridate)
lubridate::ymd("20110604")
lubridate::mdy("06-04-2011")
lubridate::dmy("04/06/2011")
#Parsing functions automatically handle a wide variety of formats and separators, which simplifies the parsing process.

#Eg1
#If your date includes time information, add h, m, and/or s to the name of the function. ymd_hms() is probably the most common date time format. To read the dates in with a certain time zone, supply the official name of that time zone in the tz argument.
OlsonNames()
Sys.timezone()
Sys.timezone(location=F)
arrive <- ymd_hms("2017-06-02 12:10:15", tz = "Asia/Calcutta")
arrive
leave <- ymd_hms("2017-06-15 14:00:00", tz = "Asia/Calcutta")
leave

leave - arrive  # Time Difference

#Setting and Extracting information
#Functions

#Eg
second(arrive)
second(arrive) = 25  #change
second(arrive)
arrive
minute(arrive)
hour(arrive)
day(arrive)
wday(arrive)
wday(arrive)
wday(arrive, label = TRUE)

week(arrive)

month(arrive)
year(arrive)
tz(arrive)

#Time Intervals
#save an interval of time as an Interval class object
(udit <- interval(arrive, leave))
(nakul <- arrive %--% leave)
(friend = interval(ymd(20170705, tz = "Asia/Calcutta"),
                   ymd(20170715, tz = "Asia/Calcutta")))
#2017-07-05 IST--2017-07-15 IST
(mypd = interval(ymd(20170702, tz = "Asia/Calcutta"),
                 ymd(20170803, tz = "Asia/Calcutta")))
#2017-07-02 IST--2017-08-03 IST
int_overlaps(friend, mypd)
#TRUE
setdiff(friend, mypd)
#2017-07-05 IST--2017-07-15 IST
#Other Functions
#int_start, int_end, int_flip, int_shift, int_aligns, union, intersect, and %within%.

# Years Betw ----------
ref_date <- as.Date('06/01/08',format='%d/%m/%y')
today <- as.Date(Sys.Date(), format='%d/%m/%y')
year(arrive) = 2015
arrive
arrive2 = as.Date(arrive, format='%d/%m/%y')
(yrsbetw = year(today)-year(ref_date))
(yrsbetw = year(today)-year(arrive2))
