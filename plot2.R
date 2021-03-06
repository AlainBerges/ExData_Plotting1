# the data file is sorted by date and time, so it's possible to take only the 1 and 2 of february 2007 
# using the skip and nrow arguments of the read.csv function.
# we have verified that this data are in [66638, 69517] rows of this file
 
library(stringr)
# reading the file, assuming it is in the working directory
## first reading ( one row ) to get the column names
df_colnames<-read.csv("household_power_consumption.txt", sep=";", nrows = 1,header = TRUE)
## reading data
df <- read.csv("household_power_consumption.txt", sep=";", skip = 66637, nrows = 2880, header = TRUE, col.names = names(df_colnames) )
rm(df_colnames)
## coecition of date and time variable
df$Time<-strptime(str_join(df$Date,df$Time), format="%d/%m/%Y %H:%M:%S")
df$Date<-as.Date(df$Date)

# writing in png format Plot 2 ( by default in 480x480)
png("plot2.png")
	par(mfcol= c(1,1))
	par(cex = 1)
	plot(df$Time,df$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()