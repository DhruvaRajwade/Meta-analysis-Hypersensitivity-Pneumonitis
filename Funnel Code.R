library(metafor)
library(meta)
dat<- read.csv("PATH", header=TRUE)
dat
res <- rma(yi=lnor, vi=var, data=dat, slab=paste(Authors))
#Ref: https://cran.r-project.org/web/packages/metafor/metafor.pdf
res
forest(res)     ##Computes the Forest Plot
regtest(res,model="lm") ##Regression Test
funnel(res,xlab = "ln(HR)",ylab = "SE.ln(HR)") ##Computes the Funnel plot
predict(res, transf=exp, digits=2)
inf <- influence(res)  ##The functions can be used to compute various outlier and influential case diagnostics (some of which indicate the influence of deleting one case at a time on the model fit or the fitted/residual values)
par(mar=c(1,1,1,1))
plot(inf)
sav<-baujat(res,symbol=19, bty="l", xlim=c(0,0.7), ylim=c(0,0.5)) 
#Ref:https://www.metafor-project.org/doku.php/plots:baujat_plot#:~:text=The%20plot%20shows%20the%20contribution,included%20in%20the%20model)%20on 
sav <- sav[sav$x >= 0 | sav$y >= 0,]
text(sav$x, sav$y, sav$slab, pos=1)

lol <-(res)
plot(lol,labels("slab"))
kek<-fitted(res)
View(kek)
blup(res)

reporter(res, format="word")
