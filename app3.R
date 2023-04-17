library(xlsx)
res <- read.xlsx("Projet R.xlsx", sheetIndex = 2 , as.data.frame = TRUE)
row.names(res)<-res[,1]
a<- data.matrix(res)
mat<-a[1:32,2:6]
heatmap(mat,Rowv=NA, Colv=NA,ylab = "M", xlab = "Var",margins = c(7, 7))