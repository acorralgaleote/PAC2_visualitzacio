install.packages("igraph")
library(igraph)

mat <- cor(t(mtcars[,c(1,3:6)]))
mat[mat<0.995] <- 0

network <- graph_from_adjacency_matrix( mat, weighted=T, mode="undirected", diag=F)

plot(network)

library(RColorBrewer)
coul <- brewer.pal(nlevels(as.factor(mtcars$cyl)), "Set2")

my_color <- coul[as.numeric(as.factor(mtcars$cyl))]

par(bg="white", mar=c(0,0,0,0))
set.seed(4)
plot(network, 
     vertex.size=12,
     vertex.color=my_color, 
     vertex.label.cex=0.7,
     vertex.label.color="black",
     vertex.frame.color="black"
)

# title and legend
text(0,0,"Diagrama de xarxa 'mtcars'",col="black", cex=1.5)
legend(x=-0.2, y=-0.12, 
       legend=paste( levels(as.factor(mtcars$cyl)), " cilindres", sep=""), 
       col = coul , 
       bty = "n", pch=20 , pt.cex = 2, cex = 1,
       text.col="black" , horiz = F)
