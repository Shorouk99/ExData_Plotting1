# Loading the dataset
df <- read.table('household_power_consumption.txt', sep = ';'
                 , na.strings = '?', header = TRUE)

# Merging the date and timeseries data columns into a single date-time column
df <- subset(df, Date == '1/2/2007' | Date == '2/2/2007')
df$Date <- paste(df$Date, df$Time)
df$Date <- strptime(df$Date, format = '%d/%m/%Y %H:%M:%S')

# Plotting
png('plot2.png')
with(df, plot(Date, Global_active_power, type='l'
              , ylab = 'Global Active Power (kilowatt)', xlab=''))

dev.off()


