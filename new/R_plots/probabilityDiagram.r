library(ggplot2)

data <- read.csv2('cell-beacon-probability.csv')

pdf(file="probabilityDiagram.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)

print(
	ggplot(data, aes(x = RSSI, y = Probability)) + geom_bar(stat= "identity")
	#qplot(RSSI, Probability, data=data, geom="bar", stat="identity")
)