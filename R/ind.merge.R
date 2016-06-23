# index merge for many-to-many merge

ind.merge <- function(l1,i1,l2,i2=i1,sorted1=F,sorted2=F) {
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
  li1 <- data.frame(i=l1[[i1]],ind1=ind1)
  li2 <- data.frame(i=l2[[i2]],ind2=ind2)
  li3 <- merge(li1,li2,by="i")
  
  l3 <- c(index=list(li3$i),ind=list(li3$ind1),l1[names(l1)!=i1],ind=list(li3$ind2),l2[names(l2)!=i2])
  attr(l3,"class") <- "ind.list"
  names(l3)[1] <- i1
  l3
}
