% File src/library/stats/man/pairwise.table.Rd
% Part of the R package, http://www.R-project.org
% Copyright 1995-2007 R Core Development Team
% Distributed under GPL 2 or later

\name{pairwise.table}
\alias{pairwise.table}
\title{Tabulate p values for pairwise comparisons}
\description{
 Creates  table of p values for pairwise comparisons
 with corrections for multiple testing.
}
\usage{
pairwise.table(compare.levels, level.names, p.adjust.method)
}
\arguments{
 \item{compare.levels}{ Function to compute (raw) p value given indices
   \code{i} and \code{j} }
 \item{level.names}{ Names of the group levels}
 \item{p.adjust.method}{Method for multiple testing adjustment}
}
\details{
  Functions that do multiple group comparisons create separate
  \code{compare.levels} functions (assumed to be symmetrical in \code{i}
  and \code{j}) and passes them to this function.
}
\value{
  Table of p values in lower triangular form.
}
\seealso{ \code{\link{pairwise.t.test}}, et al.}

\keyword{htest}
