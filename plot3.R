# Loading the dataset
df <- read.table('household_power_consumption.txt', sep = ';'
                 , na.strings = '?', header = TRUE)

# Merging the date and timeseries data columns into a single date-time column
df <- subset(df, Date == '1/2/2007' | Date == '2/2/2007')
df$Date <- paste(df$Date, df$Time)
df$Date <- strptime(df$Date, format = '%d/%m/%Y %H:%M:%S')

# Plotting
png('plot3.png')
with(df, plot(Date, Sub_metering_1, type='l', xlab=''
              , ylab = 'Energy Sub Metering'))

with(df, lines(Date, Sub_metering_2, type='l', col='red'))
with(df, lines(Date, Sub_metering_3, type='l', col='blue'))
legend('topright', col=c('black', 'red', 'blue')
       , legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
       , pch = c('___', '___', '___'))

dev.off()