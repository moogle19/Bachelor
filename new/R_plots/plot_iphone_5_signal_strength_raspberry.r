library(ggplot2)

#avgData <- c(-60, -61, -67, -73, -66, -65, -63, -59, -61)
#minData <- c(-63, -70, -83, -96, -75, -69, -69, -65, -67)
#maxData <- c(-57, -56, -58, -60, -59, -60, -58, -55, -55)

data <- read.csv(file='iphone5_raspberry_signal_strength-all.csv', head=TRUE, sep=';')

pdf(file="avgiphone5_raspberry.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)

print(
	ggplot(data = data, aes(x=distance, y=avg)) + geom_line() + ylab("Signalstärke [dBm]") + xlab("Distanz [cm]") + ggtitle("Durchschnittliche Signalstärke des Raspberry Pi im Innenraum")
)

pdf(file="alliphone5_raspberry.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)
print(
	ggplot(data = data, aes(x=distance, y=value)) + geom_line(aes(y=avg, col = 'Durchschnitt')) + geom_line(aes(y=min, col = 'Minimum')) + geom_line(aes(y=max, col = 'Maximum'))   + ylab("Signalstärke [dBm]") + xlab("Distanz [cm]") + ggtitle("Signalstärken des Raspberry Pi im Innenraum") + labs(colour = "Werte")
)
