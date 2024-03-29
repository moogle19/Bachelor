library(ggplot2)

#avgData <- c(-60, -61, -67, -73, -66, -65, -63, -59, -61)
#minData <- c(-63, -70, -83, -96, -75, -69, -69, -65, -67)
#maxData <- c(-57, -56, -58, -60, -59, -60, -58, -55, -55)

data <- read.csv(file='signal_Strength_raspberry_avg_median.csv', head=TRUE, sep=';')


pdf(file="avgmedianiphone5_raspberry.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)
print(
	ggplot(data = data, aes(x=distance, y=value)) + geom_line(aes(y=avg, col = 'Durchschnitt')) + geom_line(aes(y=median, col = 'Median')) + ylab("Signalstärke [dBm]") + xlab("Distanz [cm]") + ggtitle("Signalstärke des Raspberry Pi im Innenraum") + labs(colour = "Werte")
)
