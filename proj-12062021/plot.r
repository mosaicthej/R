setwd("C:/Users/mingr/OneDrive/Documents/GitHub/R/proj-12062021")
dir()
inp = read.csv('proj-en.csv')

library(ggplot2)

q <- ggplot(data = inp, aes(x=Residential_Population, 
                            y=GDP_per_captia))

p <- ggplot(data = inp, aes(x=Ln_Res, 
                            y=Ln_GDP))

p <- p + geom_point(colour='red', alpha=4, size=3.5)

p <- p+ geom_text(label=paste(inp$Region, sep = ''), 
                  colour = 'black')

p <- p+geom_smooth(method = lm, se=FALSE, 
                   fullrange = TRUE,
                   size = 1, colour = 'red')

p <- p + labs(x = "Ln(residential population)",
              y = "Ln(GDP per captia)")

p <- p + theme_bw()
p <- p + theme(panel.grid.major = element_blank(),
                panel.grid.minor = element_blank())

p <- p + theme(panel.border = element_blank())
p <- p + theme(axis.line = element_line())

p


q <- q + geom_point(colour='red', alpha=4, size=3.5)

q <- q+ geom_text(label=paste(inp$Region, sep = ''), 
                  colour = 'black')

q <- q+geom_smooth(method = lm, se=FALSE, 
                   fullrange = TRUE,
                   size = 1, colour = 'red')

