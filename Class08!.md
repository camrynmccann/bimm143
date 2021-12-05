Machine Learning 1
================
Camryn McCann (PID: A15437387)
10/21/2021

First up is clustering methods

#Kmeans clustering

The functon in base R to do Kmeans clustering is called *kmeans()*

First, generate some example data for clustering where we know what the
answer should be

``` r
tmp <- c(rnorm(30,-3), rnorm(30,3))
x <- cbind(x=tmp, y=rev(tmp))
x
```

    ##                x          y
    ##  [1,] -2.8697580  2.2718609
    ##  [2,] -4.1584634  4.7330996
    ##  [3,] -2.4454191  4.6464870
    ##  [4,] -3.0045788  5.0198825
    ##  [5,] -3.1277243  2.0989516
    ##  [6,] -3.5009221  2.2668114
    ##  [7,] -2.4069582  4.0293631
    ##  [8,] -3.3658175  4.4349477
    ##  [9,] -2.1648259  3.6886263
    ## [10,] -3.6770285  3.5434932
    ## [11,] -3.3129100  1.9023998
    ## [12,] -2.7812999  2.2493719
    ## [13,] -3.3859753  3.8496872
    ## [14,] -3.5653654  2.3097797
    ## [15,] -3.4649097  3.7670436
    ## [16,] -2.2930945  1.8301688
    ## [17,] -4.5271829  2.5139153
    ## [18,] -3.2710630  2.9046801
    ## [19,] -3.3175707  3.0233114
    ## [20,] -1.9813747  3.0315817
    ## [21,] -3.6379820  1.8173179
    ## [22,] -3.3039815  3.1991600
    ## [23,] -3.4027897  3.7066712
    ## [24,] -3.9307543  3.2981019
    ## [25,] -3.1847121  2.5437626
    ## [26,] -2.9305097  3.0979184
    ## [27,] -0.7742171  3.0233725
    ## [28,] -2.6211557  3.7467903
    ## [29,] -4.9407892  2.3919120
    ## [30,] -2.2242269  1.6093412
    ## [31,]  1.6093412 -2.2242269
    ## [32,]  2.3919120 -4.9407892
    ## [33,]  3.7467903 -2.6211557
    ## [34,]  3.0233725 -0.7742171
    ## [35,]  3.0979184 -2.9305097
    ## [36,]  2.5437626 -3.1847121
    ## [37,]  3.2981019 -3.9307543
    ## [38,]  3.7066712 -3.4027897
    ## [39,]  3.1991600 -3.3039815
    ## [40,]  1.8173179 -3.6379820
    ## [41,]  3.0315817 -1.9813747
    ## [42,]  3.0233114 -3.3175707
    ## [43,]  2.9046801 -3.2710630
    ## [44,]  2.5139153 -4.5271829
    ## [45,]  1.8301688 -2.2930945
    ## [46,]  3.7670436 -3.4649097
    ## [47,]  2.3097797 -3.5653654
    ## [48,]  3.8496872 -3.3859753
    ## [49,]  2.2493719 -2.7812999
    ## [50,]  1.9023998 -3.3129100
    ## [51,]  3.5434932 -3.6770285
    ## [52,]  3.6886263 -2.1648259
    ## [53,]  4.4349477 -3.3658175
    ## [54,]  4.0293631 -2.4069582
    ## [55,]  2.2668114 -3.5009221
    ## [56,]  2.0989516 -3.1277243
    ## [57,]  5.0198825 -3.0045788
    ## [58,]  4.6464870 -2.4454191
    ## [59,]  4.7330996 -4.1584634
    ## [60,]  2.2718609 -2.8697580

Let’s plot it now!

``` r
plot(x)
```

![](Class08!_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

> Q. Can we use *kmeans()* to cluster this data, setting k to 2 and
> nstart to 20?

``` r
km <- kmeans(x, centers=2, nstart=20)
km
```

    ## K-means clustering with 2 clusters of sizes 30, 30
    ## 
    ## Cluster means:
    ##           x         y
    ## 1 -3.119112  3.084994
    ## 2  3.084994 -3.119112
    ## 
    ## Clustering vector:
    ##  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2
    ## [39] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
    ## 
    ## Within cluster sum of squares by cluster:
    ## [1] 44.67935 44.67935
    ##  (between_SS / total_SS =  92.8 %)
    ## 
    ## Available components:
    ## 
    ## [1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss"
    ## [6] "betweenss"    "size"         "iter"         "ifault"

> Q. How many points are in each cluster?

``` r
km$size
```

    ## [1] 30 30

> Q. What ‘component’ of your result object details cluster
> assignment/membersip?

``` r
km$cluster
```

    ##  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2
    ## [39] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2

> What ‘component’ of your result object details cluster centers?

``` r
km$centers
```

    ##           x         y
    ## 1 -3.119112  3.084994
    ## 2  3.084994 -3.119112

> Q. Plot x colored by the kmeans cluster assignemnt and add cluster
> centers as blue points.

``` r
plot(x, col= km$cluster)
points(km$centers, col = "blue", pch = 16, cex = 1.5)
```

![](Class08!_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

A big limitation with kmeans is that we have to tell it “k” (number of
clusters we want).

#hclust clustering Now, lets use the same data with *hclust()* We will
demonstrate the use of dist(), hclust(), plot(), and cutree() functions
to do clustering.

``` r
hc <- hclust(dist(x))
hc
```

    ## 
    ## Call:
    ## hclust(d = dist(x))
    ## 
    ## Cluster method   : complete 
    ## Distance         : euclidean 
    ## Number of objects: 60

Now we can use hc to make a plot, it will result in a dendrogram!

``` r
plot(hc)
```

![](Class08!_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->

To get our cluster membership vector, we have to do a little bit more
work. We have to “cut” the tree the tree where we think it makes sense
most.For this we will use the *cutree()* function.

``` r
cutree(hc, h = 6)
```

    ##  [1] 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2
    ## [39] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2

You can also call *cutree()* setting the k = the number of
groups/clusters you want

``` r
groups <- cutree(hc, k=2)
```

Make our resluts a plot!

``` r
plot(x, col=groups)
```

![](Class08!_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->

#PCA- Principal Component Analysis

First let’s import the data

``` r
url <-"https://tinyurl.com/UK-foods"
x <- read.csv(url)
```

> **Q1. How many rows and columns are in your new data frame named x?
> What R functions could you use to answer this questions?**

``` r
nrow(x)
```

    ## [1] 17

``` r
ncol(x)
```

    ## [1] 5

Next, we should check our data, using the ‘View(x)’

The row names are set improperly! Lets fix this

``` r
x <- read.csv(url, row.names=1)
head(x)
```

    ##                England Wales Scotland N.Ireland
    ## Cheese             105   103      103        66
    ## Carcass_meat       245   227      242       267
    ## Other_meat         685   803      750       586
    ## Fish               147   160      122        93
    ## Fats_and_oils      193   235      184       209
    ## Sugars             156   175      147       139

> **Q2. Which approach to solving the ‘row-names problem’ mentioned
> above do you prefer and why? Is one approach more robust than another
> under certain circumstances?**

I prefer to fix the row-names problem using the approach in which the
row names are corrected while we have Rstudio read the data file. The
other method in which we could have removed the first column using x
\[,-1\] would work the first time, however it is risky because it would
delete columns every time we run it, which we do not want to occur.

> **Q3: Changing what optional argument in the above barplot() function
> results in the following plot?**

``` r
barplot(as.matrix(x), col=rainbow(nrow(x)))
```

![](Class08!_files/figure-gfm/unnamed-chunk-16-1.png)<!-- -->

This is unhelpful…lets try again

``` r
barplot(as.matrix(x), beside=T, col=rainbow(nrow(x)))
```

![](Class08!_files/figure-gfm/unnamed-chunk-17-1.png)<!-- -->

Setting beside=T or TRUE tells the function that we want the bars side
by side.

> **Q5: Generating all pairwise plots may help somewhat. Can you make
> sense of the following code and resulting figure? What does it mean if
> a given point lies on the diagonal for a given plot?**

``` r
pairs(x, col=rainbow(10), pch=16)
```

![](Class08!_files/figure-gfm/unnamed-chunk-18-1.png)<!-- -->

If a given point lies on the diagonal or a given plot, it means that the
paired countries have similar values for that specific variable in the
data.

> **Q6. What is the main differences between N. Ireland and the other
> countries of the UK in terms of this data-set?**

When each of the other countries is paired with N. Ireland, the plot is
not as good of a diagonal line, meaning its is less similar to the other
countries. However the other countries have diagonals when paired to
each other, meaning they are more similar in this data-set. This plot
makes it difficult for us to discover the main difference because it
does not provide us with enough details.

#PCA to the rescue

The main function in base R for PCA is *prcomp()* This wants the
transpose of our data, meaning we need to flip the rows and columns.

``` r
t(x)
```

    ##           Cheese Carcass_meat  Other_meat  Fish Fats_and_oils  Sugars
    ## England      105           245         685  147            193    156
    ## Wales        103           227         803  160            235    175
    ## Scotland     103           242         750  122            184    147
    ## N.Ireland     66           267         586   93            209    139
    ##           Fresh_potatoes  Fresh_Veg  Other_Veg  Processed_potatoes 
    ## England               720        253        488                 198
    ## Wales                 874        265        570                 203
    ## Scotland              566        171        418                 220
    ## N.Ireland            1033        143        355                 187
    ##           Processed_Veg  Fresh_fruit  Cereals  Beverages Soft_drinks 
    ## England              360         1102     1472        57         1374
    ## Wales                365         1137     1582        73         1256
    ## Scotland             337          957     1462        53         1572
    ## N.Ireland            334          674     1494        47         1506
    ##           Alcoholic_drinks  Confectionery 
    ## England                 375             54
    ## Wales                   475             64
    ## Scotland                458             62
    ## N.Ireland               135             41

Now we can use PCA!

``` r
pca <- prcomp(t(x))
summary(pca)
```

    ## Importance of components:
    ##                             PC1      PC2      PC3       PC4
    ## Standard deviation     324.1502 212.7478 73.87622 4.189e-14
    ## Proportion of Variance   0.6744   0.2905  0.03503 0.000e+00
    ## Cumulative Proportion    0.6744   0.9650  1.00000 1.000e+00

``` r
attributes(pca)
```

    ## $names
    ## [1] "sdev"     "rotation" "center"   "scale"    "x"       
    ## 
    ## $class
    ## [1] "prcomp"

> **Q7. Complete the code below to generate a plot of PC1 vs PC2. The
> second line adds text labels over the data points.**

``` r
plot(pca$x[,1], pca$x[,2], xlab="PC1", ylab="PC2", xlim=c(-270,500))
text(pca$x[,1], pca$x[,2], colnames(x))
```

![](Class08!_files/figure-gfm/unnamed-chunk-23-1.png)<!-- -->

> **Q8. Customize your plot so that the colors of the country names
> match the colors in our UK and Ireland map and table at start of this
> document.**

``` r
plot(pca$x[,1], pca$x[,2], xlab="PC1", ylab="PC2", xlim=c(-270,500))
text(pca$x[,1], pca$x[,2], colnames(x), col= c("orange", "red", "blue", "green"))
```

![](Class08!_files/figure-gfm/unnamed-chunk-24-1.png)<!-- -->

Let’s dig deeper into PCA. Lets calculate how much variation each PC
counts for.

``` r
v <- round( pca$sdev^2/sum(pca$sdev^2) * 100 )
v
```

    ## [1] 67 29  4  0

Lets look at this on a graph!

``` r
barplot(v, xlab="Principal Component", ylab="Percent Variation")
```

![](Class08!_files/figure-gfm/unnamed-chunk-26-1.png)<!-- -->

Because PC1 accounts for the most variation, we are going to focus on
that.

``` r
par(mar=c(10, 3, 0.35, 0))
barplot( pca$rotation[,1], las=2 )
```

![](Class08!_files/figure-gfm/unnamed-chunk-27-1.png)<!-- -->

> **Q9: Generate a similar ‘loadings plot’ for PC2. What two food groups
> feature prominantely and what does PC2 maninly tell us about?**

``` r
par(mar=c(10, 3, 0.35, 0))
barplot( pca$rotation[,2], las=2 )
```

![](Class08!_files/figure-gfm/unnamed-chunk-28-1.png)<!-- -->

The two food groups it features prominently are Fresh_potatoes and
Soft_drinks. PC2 mainly tells us about the second axis, explaining the
second most variability of the data.

#Biplots ## The inbuilt biplot() can be useful for small datasets

``` r
biplot(pca)
```

![](Class08!_files/figure-gfm/unnamed-chunk-29-1.png)<!-- -->

#Using PCA for RNA-seq data

``` r
url2 <- "https://tinyurl.com/expression-CSV"
rna.data <- read.csv(url2, row.names=1)
head(rna.data)
```

    ##        wt1 wt2  wt3  wt4 wt5 ko1 ko2 ko3 ko4 ko5
    ## gene1  439 458  408  429 420  90  88  86  90  93
    ## gene2  219 200  204  210 187 427 423 434 433 426
    ## gene3 1006 989 1030 1017 973 252 237 238 226 210
    ## gene4  783 792  829  856 760 849 856 835 885 894
    ## gene5  181 249  204  244 225 277 305 272 270 279
    ## gene6  460 502  491  491 493 612 594 577 618 638

> **Q10: How many genes and samples are in this data set?** The samples
> are the columns and the genes are the rows.

``` r
ncol(rna.data)
```

    ## [1] 10

``` r
nrow(rna.data)
```

    ## [1] 100

Again lets transpose and plot our data

``` r
pca2 <- prcomp(t(rna.data), scale=TRUE)
plot(pca2$x[,1], pca2$x[,2], xlab="PC1", ylab="PC2")
```

![](Class08!_files/figure-gfm/unnamed-chunk-32-1.png)<!-- -->

Then, we can look at a numerical summary

``` r
summary(pca2)
```

    ## Importance of components:
    ##                           PC1    PC2     PC3     PC4     PC5     PC6     PC7
    ## Standard deviation     9.6237 1.5198 1.05787 1.05203 0.88062 0.82545 0.80111
    ## Proportion of Variance 0.9262 0.0231 0.01119 0.01107 0.00775 0.00681 0.00642
    ## Cumulative Proportion  0.9262 0.9493 0.96045 0.97152 0.97928 0.98609 0.99251
    ##                            PC8     PC9      PC10
    ## Standard deviation     0.62065 0.60342 3.348e-15
    ## Proportion of Variance 0.00385 0.00364 0.000e+00
    ## Cumulative Proportion  0.99636 1.00000 1.000e+00

Similar to the first data set, PC1 is still where “all the action is”.
Let’s look into this further!

``` r
plot(pca2, main="Quick scree plot")
```

![](Class08!_files/figure-gfm/unnamed-chunk-34-1.png)<!-- -->

``` r
## Variance captured per PC 
pca.var <- pca2$sdev^2

## Percent variance is often more informative to look at 
pca.var.per <- round(pca.var/sum(pca.var)*100, 1)
pca.var.per
```

    ##  [1] 92.6  2.3  1.1  1.1  0.8  0.7  0.6  0.4  0.4  0.0

We can use this data to make our own scree plot

``` r
barplot(pca.var.per, main="Scree Plot", 
        names.arg = paste0("PC", 1:10),
        xlab="Principal Component", ylab="Percent Variation")
```

![](Class08!_files/figure-gfm/unnamed-chunk-36-1.png)<!-- -->

Let’s add details to make it more useful

``` r
## A vector of colors for wt and ko samples
colvec <- colnames(rna.data)
colvec[grep("wt", colvec)] <- "red"
colvec[grep("ko", colvec)] <- "blue"

plot(pca2$x[,1], pca2$x[,2], col=colvec, pch=16,
     xlab=paste0("PC1 (", pca.var.per[1], "%)"),
     ylab=paste0("PC2 (", pca.var.per[2], "%)"))

text(pca2$x[,1], pca2$x[,2], labels = colnames(rna.data), pos=c(rep(4,5), rep(2,5)))
```

![](Class08!_files/figure-gfm/unnamed-chunk-37-1.png)<!-- -->

Let’s also use our ggplot that we learned priorly!

``` r
library(ggplot2)

df <- as.data.frame(pca2$x)

# Our first basic plot
ggplot(df) + 
  aes(PC1, PC2) + 
  geom_point()
```

![](Class08!_files/figure-gfm/unnamed-chunk-38-1.png)<!-- -->

Then we can add specific labels

``` r
# Add a 'wt' and 'ko' "condition" column
df$samples <- colnames(rna.data) 
df$condition <- substr(colnames(rna.data),1,2)

p <- ggplot(df) + 
        aes(PC1, PC2, label=samples, col=condition) + 
        geom_label(show.legend = FALSE)
p
```

![](Class08!_files/figure-gfm/unnamed-chunk-39-1.png)<!-- -->

Finally add some polish!

``` r
p + labs(title="PCA of RNASeq Data",
       subtitle = "PC1 clealy seperates wild-type from knock-out samples",
       x=paste0("PC1 (", pca.var.per[1], "%)"),
       y=paste0("PC2 (", pca.var.per[2], "%)"),
       caption="BIMM143 example data") +
     theme_bw()
```

![](Class08!_files/figure-gfm/unnamed-chunk-40-1.png)<!-- -->
