\name{read_clonotypes}
\alias{read_clonotypes}

\title{
Reads a clonotype_table and returns a data frame.
}

\description{
Reads a clonotype_table in a TAB-separated or OSCT format, and returns a data frame
that has eight columns, for library name, V and J segments names, sequence read
identifier, DNA, sequence quality, aminoacid sequence of the CDR3 region, mark
for unproductive recombinations, and mark for ambiguous sequences.
}

\usage{
read_clonotypes(filename, scores=TRUE, ...)
}

\arguments{

\item{filename}{Path to the tabulation-delimited text file containing the extracted clonotypes.}

\item{scores}{Set to false to load legacy data that did not contain \dQuote{score} and \dQuote{mapq} columns.}

\item{...}{The rest of the arguments are passed to the \code{read.table()} function.}
}

\value{
\item{lib}{Library name (factor).}
\item{V}{V segment name (factor).}
\item{J}{J segment name (factor).}
\item{score}{Alignment score (numeric).}
\item{mapq}{Mapping quality (numeric).  A sequence with a good alignment score will still have a low mapping quality if there are good alternative alignments to other V segments.}
\item{read}{Sequence read identifier (character).}
\item{dna}{DNA sequence of the CDR3 region (character).}
\item{qual}{Quality values for the DNA sequence (character).}
\item{pep}{Translation of the DNA sequence (character).}
\item{unproductive}{Flag indicating stop codons or frame shifts (logical).}
\item{ambiguous}{Flag indicating that the DNA sequences has ambiguous (\dQuote{N}) nucleotides (logical).}
}

\author{Charles Plessy}

\seealso{
\code{\link{clonotype_table}}, \code{\link{is_unproductive}},
\code{\link{read.table}},
Order Switchable Column Table (OSCT, \url{http://sourceforge.net/projects/osctf/})
}

\examples{
clonotypes <- read_clonotypes(system.file('extdata', 'clonotypes.txt.gz', package = "clonotypeR"))
}

\keyword{clonotypes}
