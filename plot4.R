## DF Setup
# Read DF
df = read.table("household_power_consumption.txt", sep=";", header=TRUE)

# Only keep dates needed
df <- df[which(df$Date == "1/2/2007" | df$Date == "2/2/2007"),]

# Combine date and time, format
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

# Cast strings as double for floats
df$Global_active_power   <- as.double(df$Global_active_power)
df$Global_reactive_power <- as.double(df$Global_reactive_power)
df$Voltage               <- as.double(df$Voltage)
df$Global_intensity      <- as.double(df$Global_intensity)

# Cast strings as ints for ints
df$Sub_metering_1 <- as.integer(df$Sub_metering_1)
df$Sub_metering_2 <- as.integer(df$Sub_metering_2)

## Plot 4
par(mfrow=c(2,2))

with(df,{
  plot(DateTime, Global_active_power, type="l")

  plot(DateTime, Voltage, type="l")
  
  plot(DateTime, Sub_metering_1, type="l", col="black")
  lines(DateTime, Sub_metering_2, type="l", col="red")
  lines(DateTime, Sub_metering_3, type="l", col="blue")
  legend("topright", pch=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  with(df,plot(DateTime, Global_reactive_power, type="l"))
})
