# Loading the dataset
df <- read.table('household_power_consumption.txt', sep = ';'
                 , na.strings = '?', header = TRUE)

df <- subset(df, Date == '1/2/2007' | Date == '2/2/2007')
df$Date <- as.Date(df$Date, format = '%d/%m/%Y')

# Plotting the Histogram
png(filename = 'plot1.png')
hist(df$Global_active_power, col='red', main='Global Active Power'
     , xlab = 'Global Active Power (kilowatts)')

dev.off()