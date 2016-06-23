# rle merge for one-to-many merge

rle.merge <- function(l1,i1,l2,i2=i1,sorted1=F,sorted2=F) {
  # if (is.null(i2)) { i2 <- i1 }
  if (!(i1 %in% names(l1)) | !(i2 %in% names(l2))) { return(NULL) }
  if (!sorted1) {
    class(l1) <- "data.frame"; attr(l1, "row.names") <- .set_row_names(length(l1[[i1]]))
    l1 <- l1[order(l1[[i1]]),]
    class(l1) <- "list"; attr(l1, "row.names") <- NULL
  }
  if (!sorted2) {
    class(l2) <- "data.frame"; attr(l2, "row.names") <- .set_row_names(length(l2[[i2]]))
    l2 <- l2[order(l2[[i2]]),]
    class(l2) <- "list"; attr(l2, "row.names") <- NULL
  }
  rle1 <- integer(length(l1[[i1]]))
  rle2 <- integer(length(l2[[i2]]))
  k1 <- k2 <- 1
  while ((k1 <= length(l1[[i1]])) & (k2 <= length(l2[[i2]]))) {
    if (l1[[i1]][k1] == l2[[i2]][k2]) {
      rle1[k1] <- rle1[k1] + 1
      rle2[k2] <- rle2[k2] + 1
      k2 <- k2 + 1
    } else if (l1[[i1]][k1] < l2[[i2]][k2]) {
      k1 <- k1 + 1
    } else {
      k2 <- k2 + 1
    }
  }
  l3 <- c(index=list(rep(l1[[i1]],rle1)),rle=list(rle1),l1[names(l1)!=i1],rle=list(rle2),l2[names(l2)!=i2])
  attr(l3,"class") <- "rle.list"
  names(l3)[1] <- i1
  l3
}

