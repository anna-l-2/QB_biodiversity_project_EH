#Invasive AM
invasive.AM.ss.L <-invasive.AM.ss[,-1]
#dim(invasive.AM.ss)

tree.bray.iAM <-vegdist(invasive.AM.ss.L[1:3751, 1:52], method = "bray")

order.iAM <-rev(attr(tree.bray.iAM, "Labels"))
levelplot(as.matrix(tree.bray.iAM)[,order.iAM], aspect = "iso", col.regions =inferno,
          xlab = "Plot", ylab = "Plot", scales =list(cex =.5),
          main = "Bray-Curtis Distance Invasive AM")


#Invasive ECM
invasive.ECM.ss.L <-invasive.ECM.ss[,-1]
dim(invasive.ECM.ss.L)

tree.bray.iECM <-vegdist(invasive.ECM.ss.L[1:2697, 1:43], method = "bray")

order.iECM <-rev(attr(tree.bray.iECM, "Labels"))
levelplot(as.matrix(tree.bray.iECM)[,order.iECM], aspect = "iso", col.regions =inferno,
          xlab = "Plot", ylab = "Plot", scales =list(cex =.5),
          main = "Bray-Curtis Distance ECM")


