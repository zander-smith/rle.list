rm(list=ls())
i1 <- c(1,2,3,4)
v1 <- c("a","b","c","d")

l1 <- list(i1,v1); names(l1) <- c("i1","v1")
l1
# names(l1)[1] <- "i1"

# ---

i1 <- c(4,4,2,2,2,3,1,1)
v2 <- c("w","z","y","y","x","w","z","v")

l2 <- list(i1,v2); names(l2) <- c("i1","v2")
l2

# t1 <- "i1"
# l1[names(l1)!=t1]
# TRUE & FALSE
# typeof((c(v1=list(v1),l1,l2)))
# ?attr

# ---

i1 <- "i1"
i2 <- NULL
sorted1 <- F
sorted2 <- F

# ---

(my.rle.list <- rle.merge(l1,i1,l2))


