\name{GGPA-package}
\alias{GGPA-package}
\docType{package}
\title{
graph-GPA
}
\description{
This package provides functions for fitting graph-GPA,
a statistical framework to prioritize GWAS results by integrating pleiotropy.
}
\details{
\tabular{ll}{
Package: \tab GGPA\cr
Type: \tab Package\cr
Version: \tab 0.9.6\cr
Date: \tab 2018-01-15\cr
License: \tab GPL (>= 2)\cr
LazyLoad: \tab yes\cr
}
This package contains a main class, \code{GGPA}, which represents graph-GPA model fit.
This package contains four main methods, 
\code{GGPA}, \code{assoc}, and \code{plot}.
\code{GGPA} method fits the graph-GPA model
and \code{assoc} method implements association mapping.
\code{plot} method provides a graph representing genetic relationship among phenotypes.
}
\author{
Hang J. Kim and Dongjun Chung

Maintainer: Hang J. Kim <hang.kim@uc.edu>, Dongjun Chung <dongjun.chung@gmail.com>
}
\references{
Chung D, Kim H, and Zhao H (2016), 
"graph-GPA: A graphical model for prioritizing GWAS results and investigating pleiotropic architecture," 13(2): e1005388

Kim H, Yu Z, Lawson A, Zhao H, and Chung D (2017),
"Improving SNP prioritization and pleiotropic architecture estimation by incorporating prior knowledge using graph-GPA."
}
\keyword{ package }
\seealso{
\code{\link{GGPA}}, \code{\link{assoc}}, \code{\link{plot}}, 
\code{\linkS4class{GGPA}}.
}
\examples{
library(GGPA)

# load simulation data

data(simulation)
		
# fit graph-GPA model

fit <- GGPA( simulation$pmat, nBurnin=200, nMain=200 )
fit

# fit graph-GPA model using a prior phenotype graph
# as an example, edge 6-7 added & edge 2-3 removed in pgraph

pgraph <- matrix( 0, ncol(simulation$pmat), ncol(simulation$pmat) )
pgraph[1,2] <- pgraph[1,3] <- pgraph[6,7] <- pgraph[4,5] <- 1
fit.pg <- GGPA( simulation$pmat, pgraph, nBurnin=200, nMain=200 )
fit.pg

# association mapping for each phenotype

head(assoc( fit, FDR=0.1, fdrControl="global" ))

# hypothesis testing for 1st and 2nd phenotype pair

head(assoc( fit, FDR=0.1, fdrControl="global", i=1, j=2 ))

# plot phenotype graph

plot(fit)
plot(fit.pg)
}