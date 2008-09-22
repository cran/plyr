\name{amv_dimnames}
\alias{amv_dimnames}
\title{Dimension names}
\author{Hadley Wickham <h.wickham@gmail.com>}

\description{
Consistent dimnames for vectors, matrices and arrays.
}
\usage{amv_dimnames(x)}
\arguments{
\item{x}{array, matrix or vector}
}

\details{Unlike \code{\link{dimnames}} no part of the output will ever be
null.  If a component of dimnames is omitted, \code{amv_dimnames}
will return an integer sequence of the appropriate length.}

\examples{}
\keyword{internal}
