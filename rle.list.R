
rle.merge (d1,index1,d2,index2=NULL,sorted1=F,sorted2=F)
  if i2 == NULL then i2 = i1
  if (i1 not in d1) or (i2 not in d2) then error
  if !sorted1 then sort d1 by i1
  if !sorted2 then sort d2 by i2
    rle1 <- numeric(length(d1$i1))
    rle2 <- numeric(length(d2$i2))
    k1 <- k2 <- 1
  while (k1 <= length(d1$i1)) and (k2 <= length(d2$i2))
  if (d1$i1[k1] == d2$i2[k2]) then
    rle1[k1] <- rle1[k1] + 1
    rle2[k2] <- rle2[k2] + 1
    k2 <- k2 + 1
  else if(d1$i1[k1] < d2$i2[k2]) then
    k1 <- k1 + 1
  else
    k2 <- k2 + 1
  end
  end
  attr("class") <- "rle.df"
  list(index=rep(d1$i1,rle1),rle1,unlist(d1),rle2,unlist(d2))
end

