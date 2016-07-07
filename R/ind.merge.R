# index merge for many-to-many merge

index.merge <- function(l1,i1,l2,i2=i1,sorted1=F,sorted2=F) {
  require(data.table)
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
  ind1 <- 1:length(l1[[i1]])
  ind2 <- 1:length(l2[[i2]])
  li1 <- data.table(i=l1[[i1]],ind1=ind1)
  li2 <- data.table(i=l2[[i2]],ind2=ind2)
  li3 <- merge(li1,li2,by="i")
  
  l3 <- c(key=list(li3$i),index=list(li3$ind1),l1[names(l1)!=i1],index=list(li3$ind2),l2[names(l2)!=i2])
  attr(l3,"class") <- "index.list"
  names(l3)[1] <- i1
  l3
}

'[.index.list' <- function(x, i) {
  x[[1]][i]
}

'[<-.index.list' <- function(x, i, value) {
  x[[1]] <- '[<-'(x[[1]],i,value)
  x
}

as.data.frame.index.list <- function(x, ...) {
  res <- x[1]
  for (i in 2:length(x)) {
    if (names(x)[i]=="index") index <- i else res <- c(res,list(x[[i]][x[[index]]]))
  }
  class(res) <- "data.frame"; attr(res, "row.names") <- .set_row_names(length(res[[1]]))
  names(res) <- names(x)[names(x) != "index"]
  res
}


