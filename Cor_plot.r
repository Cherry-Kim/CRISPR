c <- read.table('cor_input.txt',sep='\t', header = T)
cor.test(c$a, c$b)

#----------------------------------
plot(c$a, c$b, xlab="a", ylab = "b", pch=16,  main="Pearson correlation =0.7")
abline(v=0,col='black',lty=3,lwd=1.0)
abline(h=0,col='black',lty=3,lwd=1.0)

c$SigE <- ifelse( c$a <= -5.0, TRUE, FALSE)
text(c$a[c$SigE], c$b[c$SigE], lab=c$ID[c$SigE],cex=0.7,col='red',pos=4)
more  <- which( c$a <= -5.0 )
more.sig <- c[more,]
points(more.sig$a, more.sig$b, col="red",pch=20,cex=1.0)
more2 <- which( c$ID == "gene1" | c$ID == "gene2" )
more.sig2<-c[more2,]
#points(more.sig2$a, more.sig2$b, col="green",pch="?",cex=0.8)


c$SigL <- ifelse( c$b <= -7, TRUE, FALSE)
text(c$a[c$SigL], c$b[c$SigL], lab=c$ID[c$SigL],cex=0.7,col='blue',pos=4)
moreL  <- which( c$b <= -7.0 )
more.sigL <- c[moreL,]
points(more.sigL$a,more.sigL$b,col="blue",pch=20,cex=1.0)
#points(more.sigL$a,more.sigL$b,col="green",pch="?",cex=0.8)
legend("topright",legend=c("a","b"),fill=c("red","blue"),border="white",box.lty=0,cex=0.5)
