
##Example script
library(metafor)
library(meta)
dat<- read.csv("honey_u.csv", header=TRUE)
dat
res <- rma(yi=lnor, vi=var, data=dat, slab=paste(Authors))
res
forest(res)
regtest(res,model="lm")
funnel(res,xlab = "ln(HR)",ylab = "SE.ln(HR)")
predict(res, transf=exp, digits=2)
inf <- influence(res)
par(mar=c(1,1,1,1))
plot(inf)
sav<-baujat(res,symbol=19, bty="l", xlim=c(0,0.7), ylim=c(0,0.5))
sav <- sav[sav$x >= 0 | sav$y >= 0,]
text(sav$x, sav$y, sav$slab, pos=1)

lol <-(res)
plot(lol,labels("slab"))
kek<-fitted(res)
View(kek)
blup(res)

reporter(res, format="word")
