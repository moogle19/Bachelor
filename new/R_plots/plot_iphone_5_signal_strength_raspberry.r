library(ggplot2)

#avgData <- c(-60, -61, -67, -73, -66, -65, -63, -59, -61)
#minData <- c(-63, -70, -83, -96, -75, -69, -69, -65, -67)
#maxData <- c(-57, -56, -58, -60, -59, -60, -58, -55, -55)

data <- read.csv(file='iphone5_raspberry_signal_strength-all.csv', head=TRUE, sep=';')

pdf(file="avgiphone5_raspberry.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)

print(
	ggplot(data = data, aes(x=distance, y=avg)) + geom_line() + ylab("Signal Strength [dBm]") + xlab("Distance [cm]") + ggtitle("Indoor Average Signal Strength of Raspberry Pi")
)

pdf(file="alliphone5_raspberry.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)
print(
	ggplot(data = data, aes(x=distance, y=value)) + geom_line(aes(y=avg, col = 'avg')) + geom_line(aes(y=min, col = 'min')) + geom_line(aes(y=max, col = 'max'))   + ylab("Signal Strength [dBm]") + xlab("Distance [cm]") + ggtitle("Indoor Signal Strength of Raspberry Pi Beacon") + labs(colour = "values")
)
