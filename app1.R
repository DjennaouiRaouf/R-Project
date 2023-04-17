library(leaflet)
library(xlsx)

# en utilisant la librairie leaflet  l api de carte elle necessite la connextion a internet
# installer leaflet
res1 <- read.xlsx("Projet R.xlsx", sheetIndex = 3 ,  as.data.frame = TRUE)
#lecture de la 3émme feuille excel

res2 <- read.xlsx("map_data.xlsx", sheetIndex = 1 ,  as.data.frame = TRUE)
#ce fichier contient les coordonnée gps de chaque wilaya dans le but de positionner les marqueurs


m <- leaflet()

n=c(1:48)
for(i in n)
{
  w<-res2$wilaya[[i]]
  map1<-res1$Map1[[i]]
  map2<-res1$Map2[[i]]
  lng<-res2$longitude[[i]]
  lat<-res2$latitude[[i]]
  lng=as.double(as.character(lng))
  lat=as.double(as.character(lat))
  map1<-as.character(map1)
  map2<-as.character(map2)
  tmp<-i
  tmp<-as.character(tmp)
  tmp<-paste("Numero : ",tmp)
  w<-paste("Wilaya : ",w)
  a<-paste("<center><b><i><font color=\"red\" size=\"5\">",tmp,"</font><i></b></center><br>")
  b<-"  <span style=\"text-decoration-line: underline;text-decoration-style: double;\"><b><i><font color=\"red\" size=\"5\">"
  b<-paste(b,w,"</font><i></b>","<br></span><br>")
  b<-paste(a,b)
  b<-paste(b,"<font size=\"3\"<b>MAP1 :",map1,"</b></font>","<br>")
  b<-paste(b,"<font size=\"3\"<b>MAP2 :",map2,"</b></font><br>")

  m <- addTiles(m)
  m <- addMarkers(m, lng, lat, popup=b)

}

m
