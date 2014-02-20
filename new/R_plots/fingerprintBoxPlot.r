library(ggplot2)
library(reshape2)

#data <- read.csv(file='DataFingerprintsiPhone5.csv', head=TRUE, sep=';')
data <- read.csv2('DataFingerprintsiPhone5.csv')

pdf(file="boxplotiPhone5.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)
dat_m <- melt(data, id.var = "distance")

# plot data




print(
	#ggplot(data=data.m, aes(group, value)) + geom_boxplot()
	boxplot(value ~ distance, dat_m)	
)


data4s <- read.csv2('DataFingerprintsiPhone4s.csv')

pdf(file="boxplotiPhone4s.pdf", onefile=TRUE, pagecentre=TRUE, width=12, height=6)
dat_m4s <- melt(data4s, id.var = "distance")

# plot data




print(
	#ggplot(data=data.m, aes(group, value)) + geom_boxplot()
	boxplot(value ~ distance, dat_m4s)	
)