rm(list=ls())
i1 <- c(1,2,2,3,4)
v1 <- c("a","b","c","d","e")
v2 <- c("q","w","e","r","t")

l1 <- list(i1,v1,v2); names(l1) <- c("i1","v1","v2")
l1

# ---

i2 <- c(4,4,2,2,2,3,1,1)
v3 <- c("w","z","y","y","x","w","z","v")
v4 <- c("x","c","v","b","n","m","f","g")

l2 <- list(i2,v3,v4); names(l2) <- c("i2","v3","v4")
l2

# ---

i1 <- "i1"
i2 <- "i2"
# sorted1 <- F
# sorted2 <- F

(my.ind.list <- ind.merge(l1,i1,l2,i2))
