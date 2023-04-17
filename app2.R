library(xlsx)
res <- read.xlsx("Projet R.xlsx", sheetIndex = 1 , as.data.frame = TRUE)
row.names(res)<-res[,1]
a<- data.matrix(res)
mat<-a[1:10,2:5]
heatmap(mat,Rowv=NA, Colv=NA,ylab = "M", xlab = "Var",margins = c(7, 7))
