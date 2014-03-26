library(ggplot2)

#avgData <- c(-60, -61, -67, -73, -66, -65, -63, -59, -61)
#minData <- c(-63, -70, -83, -96, -75, -69, -69, -65, -67)
#maxData <- c(-57, -56, -58, -60, -59, -60, -58, -55, -55)

data <- read.csv(file='DataiPhone4s.csv', head=TRUE, sep=';')

pdf(file="avgiphone4s.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)

print(
	ggplot(data = data, aes(x=distance, y=avg_signalstrength)) + geom_line() + ylab("Signalstärke [dBm]") + xlab("Distanz [cm]") + ggtitle("Durchschnittliche Signalstärke des kontakt.io Beacon im Innenraumn") + ylim(c(-75,-50))
)
	
pdf(file="miniphone4s.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)
print(
	ggplot(data = data, aes(x=distance, y=min_signalstrength)) + geom_line() + ylab("Signalstärke [dBm]") + xlab("Distanz [cm]") + ggtitle("Minimale Signalstärke des kontakt.io Beacon im Innenraum") + ylim(c(-100,-60))
)

pdf(file="maxiphone4s.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)
print(
	ggplot(data = data, aes(x=distance, y=max_signalstrength)) + geom_line() + ylab("Signalstärke [dBm]") + xlab("Distanz [cm]") + ggtitle("Maximale Signalstärke des kontakt.io Beacon im Innenraum") + ylim(c(-70,-45))
)


pdf(file="alliphone4s.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)
print(
	ggplot(data = data, aes(x=distance, y=value)) + geom_line(aes(y=avg_signalstrength, col = 'avg')) + geom_line(aes(y=min_signalstrength, col = 'min')) + geom_line(aes(y=max_signalstrength, col = 'max'))   + ylab("Signalstärke [dBm]") + xlab("Distanz [cm]") + ggtitle("Signalstärke des kontakt.io Beacon im Innenraum") + labs(colour = "Values") + ylim(c(-100,-45))

)