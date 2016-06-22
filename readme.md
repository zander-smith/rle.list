rle.list
--------

An rle (run length encoded) list is similar to an R data.frame. It consists of
a number of column vectors that are run length encoded in order to reduce space.

Some vectors indicate run lengths and are applied to subsequent column vectors until
the end of the list is reached or another run length vector is encountered.

For example :

``` r
rle.list <- list(rle.vector1, v1, v2, ..., rle.vector2, v3, v4, ...)
```

In the above example the run length vector *rle.vector* is applied to vectors v1
and v2, while *rle.vector2* is applied to v3 and v4.

Merging datasets with one to many relationships results in many repeated contributions
from the first dataset. Rle.list attempts to eliminate such duplication by creating
shared run length vectors which are applied to subsequent column vectors.
