library(ggplot2)
library(reshape2)

#data <- read.csv(file='DataFingerprintsiPhone5.csv', head=TRUE, sep=';')
data <- read.csv2('DataFingerprintsiPhone5Body.csv')

pdf(file="boxplotiPhone5Body.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)
dat_m <- melt(data, id.var = "Orientation")

# plot data




print(
	#ggplot(data=data.m, aes(group, value)) + geom_boxplot()
	boxplot(value ~ Orientation, dat_m, ylab="Signalstärke in dBm", xlab="Ausrichtung zum Beacon")	
)
