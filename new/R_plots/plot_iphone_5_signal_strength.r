library(ggplot2)

#avgData <- c(-60, -61, -67, -73, -66, -65, -63, -59, -61)
#minData <- c(-63, -70, -83, -96, -75, -69, -69, -65, -67)
#maxData <- c(-57, -56, -58, -60, -59, -60, -58, -55, -55)

data <- read.csv(file='DataiPhone5.csv', head=TRUE, sep=';')

pdf(file="avgiphone5.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)

print(
	ggplot(data = data, aes(x=distance, y=avg_signalstrength)) + geom_line() + ylab("Signal Strength [dBm]") + xlab("Distance [cm]") + ggtitle("Indoor Average Signal Strength of kontakt.io Beacon")
)
	
pdf(file="miniphone5.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)
print(
	ggplot(data = data, aes(x=distance, y=min_signalstrength)) + geom_line() + ylab("Signal Strength [dBm]") + xlab("Distance [cm]") + ggtitle("Indoor Minimal Signal Strength of kontakt.io Beacon")
)

pdf(file="maxiphone5.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)
print(
	ggplot(data = data, aes(x=distance, y=max_signalstrength)) + geom_line() + ylab("Signal Strength [dBm]") + xlab("Distance [cm]") + ggtitle("Indoor Maximal Signal Strength of kontakt.io Beacon")
)


pdf(file="alliphone5.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)
print(
	ggplot(data = data, aes(x=distance, y=value)) + geom_line(aes(y=avg_signalstrength, col = 'avg')) + geom_line(aes(y=min_signalstrength, col = 'min')) + geom_line(aes(y=max_signalstrength, col = 'max'))   + ylab("Signal Strength [dBm]") + xlab("Distance [cm]") + ggtitle("Indoor Signal Strength of kontakt.io Beacon") + labs(colour = "values")
)