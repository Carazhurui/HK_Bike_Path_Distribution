library("ggplot2")
library("SnowballC") 
library("tm") 
library("RColorBrewer")
library("wordcloud")
library("wordcloud2")
library('jiebaR')
library('jiebaRD')
install.packages("jiebaR")


f <- scan('~/Desktop/news_content.txt',sep='\n',what='',encoding="UTF-8")


seg <- qseg[f]
seg <- seg[nchar(seg)>1] #去除字符长度小于2的词语

seg <- table(seg) #统计词频

seg <- seg[!grepl('[0-9]+',names(seg))] #去除数字
length(seg) #查看处理完后剩余的词数
seg <- sort(seg, decreasing = TRUE)[1:100] #降序排序，并提取出现次数最多的前100个词语

seg

wordcloud2(seg,size = 0.8, minRotation = -pi/6, maxRotation = -pi/6,
           rotateRatio = 1)

bmp("comment_cloud.bmp", width = 500, height = 500)
par(bg = "black")
wordcloud(names(seg), seg, colors = rainbow(100), random.order=F)
dev.off()





