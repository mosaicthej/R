setwd("C:/Users/mingr/OneDrive/Documents/GitHub/R/proj-12062021")
#set write directory
#这里要改成你自己文件夹的路径

dir()

inp = read.csv('proj-en.csv')

library(ggplot2)


p <- ggplot(data = inp, aes(x=Ln_Res, 
                            y=Ln_GDP))

p <- p + geom_point(colour='red', alpha=4, size=1.5)

p <- p+ geom_text(label=paste(inp$Region, sep = ''), 
                  colour = 'black')

p <- p+geom_smooth(method = lm, se=FALSE, 
                   fullrange = TRUE,
                   size = 1, colour = 'red')

p <- p + labs(x = "Ln(residential population)",
              y = "Ln(GDP per captia)")

p <- p + theme_bw()
#背景涂白
p <- p + theme(panel.grid.major = element_blank(),
                panel.grid.minor = element_blank())
#把格子变白

p <- p + theme(panel.border = element_blank())
#去掉边框

p <- p + theme(axis.line = element_line())
#增加x，y轴的线

p



inp_cn = read.csv('proj-cn.csv',
                  encoding = 'UTF-8',
                  stringsAsFactors = TRUE)

q <- ggplot(data = inp, aes(x=Ln_Res, 
                            y=Ln_GDP))

q <- q + geom_point(colour='red', alpha=4, size=1.5)

q <- q+ geom_text(label=paste(inp_cn$X.U.FEFF.地区, sep = ''), 
                  colour = 'black')

q <- q+geom_smooth(method = lm, se=FALSE, 
                   fullrange = TRUE,
                   size = 1, colour = 'red')


q <- q + labs(x = "Ln(常住人口)",
              y = "Ln(人均GDP)")

q <- q + theme_bw()
q <- q + theme(panel.grid.major = element_blank(),
               panel.grid.minor = element_blank())

q <- q + theme(panel.border = element_blank())
q <- q + theme(axis.line = element_line())

q