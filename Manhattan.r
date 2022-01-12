### 1. python pos.py  ->  2. chromosome,pos sorting **
data <- read.table("a.gene_summary.pos.sort.txt",sep='\t',header=T)

par(las="2",cex=1.0)
#colors <- rep(c("azure4","azure3"),11)
colors <- rep(c("gray"),22)

p <- data$pvalue
kare <- as.vector(table(data$CHR))
CM <- cumsum(kare)
n.markers <- sum(kare)
n.chr <- length(kare)
ss <- 1:n.markers
pos <- ss

y <- -log(p,10)

par(xaxt = "n", yaxt = "n")
plot(ss, y, type = "n", xlab = "Chromosome", ylab = "-log10(p value)", axes = FALSE, ylim=c(0,max(-log(p,10))))
    axis(1, tick = FALSE)
    axis(2, tick = FALSE)

points(ss,y,col=colors[1],pch=20)

for (i in 1:n.chr) {
      u <- CM[i]
      l <- CM[i] - kare[i] + 1
      cat("Plotting points ", l, "-", u, "\n")
      chr <- l:u
      y <- -log(p[chr],10)
            points(pos[chr], y, col = colors[i],pch=20)
}

par(xaxt = "s", yaxt = "s")
axis(1, at = c(0, CM[-n.chr]), labels =  c(1:19,"X"), las=1)
axis(2, at = 0:40)

############## Red point ###############
a <- which( data$neg.lfc <(-1) )
a.sig<-data[a,]
points(a,-log(a.sig$neg.scor,10),col="purple",pch=20,cex=1.0)

b <- which( data$neg.lfc >1 )
b.sig<-data[b,]
points(b,-log(b.sig$neg.scor,10),col="black",pch=20,cex=1.0)

######################  more sig   ########################
#more <- which( rank( data$neg.scor) < 10 )
more  <- which( data$neg.score <0.049 )
more.sig<-data[more,]
length(more)
points(more,-log(more.sig$neg.scor,10),col="red",pch=20,cex=1.0)
text(more,-log(more.sig$neg.scor,10), vfont = NULL, lab=(more.sig$id), cex=0.8, col='red', pos=3)

d<- which(more.sig$neg.scor==max(more.sig$neg.scor))
abline(h=-log(more.sig$neg.scor[d],10), lty= 1)

more2 <- which( rank( data$neg.lfc) <=3 )
more.sig2<-data[more2,]
points(more2,-log(more.sig2$neg.scor,10),col="green",pch="✌",cex=0.8)

#data$logp = -log10 (data$neg.score)

