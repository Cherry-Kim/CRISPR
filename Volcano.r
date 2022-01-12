        a <- read.table('a.gene_summary.txt',sep='\t', header = T)
        topT <- as.data.frame(a)

        par(mar=c(5,5,5,5), cex=1.0, cex.main=1.4,cex.axis=1.4,cex.lab=1.4)
        with(topT, plot(neg.lfc, -log10(neg.p.value), pch=20,col='gray',cex=1.0,ylab="-log10 pvalue",xlab="a (neg|lfc)"))
        with(subset(topT, neg.p.value<0.05 & neg.lfc<(-1)), points(neg.lfc, -log10(neg.p.value), pch=20,col='red',cex=1.5))
        with(subset(topT, neg.p.value<0.05 & neg.lfc>1), points(neg.lfc, -log10(neg.p.value), pch=20,col='blue',cex=1.5))

        abline(v=0, col='black', lty=3, lwd=1.0)
        abline(v=-1, col='black', lty=4, lwd=1.0)
        abline(v=1, col='black', lty=4, lwd=1.0)
        abline(h=-log10(max(topT$neg.p.value[topT$neg.p.value<0.05], na.rm=TRUE)), col='black', lty=4, lwd=2.0)

        topT$SigE <- ifelse( (topT$neg.p.value<0.05 & topT$neg.lfc <(-1)), TRUE, FALSE
        Sig <- topT$SigE
        text(topT$neg.lfc[Sig], -log10(topT$neg.p.value)[Sig], vfont = NULL, lab=(topT$id)[Sig], cex=0.6, col='black', pos=4)
}
