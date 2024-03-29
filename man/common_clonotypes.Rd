\name{common_clonotypes}
\alias{common_clonotypes}
\alias{common_clonotypes,missing,missing,missing,data.frame-method}
\alias{common_clonotypes,character,missing,missing,data.frame-method}
\alias{common_clonotypes,character,character,missing,data.frame-method}
\alias{common_clonotypes,missing,missing,character,data.frame-method}
\alias{common_clonotypes,missing,missing,missing,matrix-method}
\alias{common_clonotypes,missing,missing,ANY,data.frame-method}
\alias{common_clonotypes,missing,missing,ANY,matrix-method}

\title{Reports clonotypes common between libraries.}

\description{

When given one group of libraries, lists the clonotypes that have been observed
at least in one library of that group.  The returned list can be used to subset
a data frame produced by \code{\link{clonotype_table}}.

When given two groups of libraries, lists the clonotypes that have been observed
at least in one library of each group.  Groups can contain a single library, in
which case the returned list is simply the clonotypes found in both libraries.

When given a table of clonotypes, produces a matrix in which each cell reports
quantitatively the overlap between each pair of libraries.
}

\usage{common_clonotypes(group1, group2, mode, data)}

\arguments{
  \item{group1}{A character vector containing clonotype library names.}
  \item{group2}{A character vector containing clonotype library names.}
  \item{mode}{Only when producing a matrix of pairwise comparisons: \dQuote{count} (default) or \dQuote{abundance}, see below.}
  \item{data}{A clonotype table where the data is stored.}
}

\value{

In \dQuote{count} mode, each value in a matrix is the number of clonotypes seen
in both of the two libraries considered.  The matrix is therefore symmetric.

In \dQuote{abundance} mode, each value indicates, for a given pair of
libraries, the cumulative abundance of the common clonotypes (seen in both
libraries), calculated for the library indicated by the row.  The matrix is
therefore not symmetric.  For instance, a pair of libraries A and B can have
100 sequences each in total, one clonotype in common, which is found 8 times in
A, but 54 times in B.  }

\author{Charles Plessy}

\seealso{
\code{\link{clonotype_table}}, \code{\link{unique_clonotypes}}
}

\examples{
# Load example data
clonotypes.long <- read_clonotypes(system.file('extdata', 'clonotypes.txt.gz', package = "clonotypeR"))
clonotypes <- clonotype_table(levels(clonotypes.long$lib), data=clonotypes.long)
summary(clonotypes)

# List clonotypes found in library A, and B or C.
common_clonotypes(group1="A", group2=c("B","C"), data=clonotypes)

# Count clonotypes found in library A, and B or C.
length(common_clonotypes(group1="A", group2=c("B","C"), data=clonotypes))

# Matrix of numbers of common clonotypes
common_clonotypes(data=clonotypes)

# Matrix of abundance of common clonotypes
common_clonotypes(data=clonotypes, mode="abundance")
}

\keyword{ clonotype }% __ONLY ONE__ keyword per line
