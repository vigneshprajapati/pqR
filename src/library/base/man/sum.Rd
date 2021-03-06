% File src/library/base/man/sum.Rd
% Part of the R package, http://www.R-project.org
% Copyright 1995-2011 R Core Development Team
% Distributed under GPL 2 or later

\name{sum}
\alias{sum}
\title{Sum of Vector Elements}
\description{
  \code{sum} returns the sum of all the values
  present in its arguments.
}
\usage{
sum(\dots, na.rm = FALSE)
}
\arguments{
  \item{\dots}{numeric or complex or logical vectors.}
  \item{na.rm}{logical.  Should missing values (including \code{NaN}) be
    removed?}
}
\value{
  The sum. If all of \code{\dots} are of type integer or logical, then
  the sum is integer, and in that case the result will be \code{NA} (with a
  warning) if integer overflow occurs.  Otherwise it is a length-one
  numeric or complex vector.

  \strong{NB:} the sum of an empty set is zero, by definition.
}
\details{
  This is a generic function: methods can be defined for it
  directly or via the \code{\link[=S3groupGeneric]{Summary}} group generic.
  For this to work properly, the arguments \code{\dots} should be
  unnamed, and dispatch is on the first argument.

  If \code{na.rm} is \code{FALSE} an \code{NA} or \code{NaN} value in
  any of the arguments will cause a value of \code{NA} or \code{NaN} to
  be returned, otherwise \code{NA} and \code{NaN} values are ignored.

  Logical true values are regarded as one, false values as zero.
  For historical reasons, \code{NULL} is accepted and treated as if it
  were \code{integer(0)}.
}
\section{S4 methods}{
  This is part of the S4 \code{\link[=S4groupGeneric]{Summary}}
  group generic.  Methods for it must use the signature
  \code{x, \dots, na.rm}.

  \sQuote{\link{plotmath}} for the use of \code{sum} in plot annotation.
}
\seealso{
  \code{\link{colSums}} for row and column sums.
}
\references{
  Becker, R. A., Chambers, J. M. and Wilks, A. R. (1988)
  \emph{The New S Language}.
  Wadsworth & Brooks/Cole.
}
\keyword{arith}
