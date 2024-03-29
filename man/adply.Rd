% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/adply.r
\name{adply}
\alias{adply}
\title{Split array, apply function, and return results in a data frame.}
\usage{
adply(
  .data,
  .margins,
  .fun = NULL,
  ...,
  .expand = TRUE,
  .progress = "none",
  .inform = FALSE,
  .parallel = FALSE,
  .paropts = NULL,
  .id = NA
)
}
\arguments{
\item{.data}{matrix, array or data frame to be processed}

\item{.margins}{a vector giving the subscripts to split up \code{data} by.
1 splits up by rows, 2 by columns and c(1,2) by rows and columns, and so
on for higher dimensions}

\item{.fun}{function to apply to each piece}

\item{...}{other arguments passed on to \code{.fun}}

\item{.expand}{if \code{.data} is a data frame, should output be 1d (expand
 = FALSE), with an element for each row; or nd (expand = TRUE), with a
dimension for each variable.}

\item{.progress}{name of the progress bar to use, see
\code{\link{create_progress_bar}}}

\item{.inform}{produce informative error messages?  This is turned off
by default because it substantially slows processing speed, but is very
useful for debugging}

\item{.parallel}{if \code{TRUE}, apply function in parallel, using parallel
backend provided by foreach}

\item{.paropts}{a list of additional options passed into
the \code{\link[foreach]{foreach}} function when parallel computation
is enabled.  This is important if (for example) your code relies on
external data or packages: use the \code{.export} and \code{.packages}
arguments to supply them so that all cluster nodes have the correct
environment set up for computing.}

\item{.id}{name(s) of the index column(s).
Pass \code{NULL} to avoid creation of the index column(s).
Omit or pass \code{NA} to use the default names
\code{"X1"}, \code{"X2"}, \ldots.
Otherwise, this argument must have the same length as
\code{.margins}.}
}
\value{
A data frame, as described in the output section.
}
\description{
For each slice of an array, apply function then combine results into a data
frame.
}
\section{Input}{
 This function splits matrices, arrays and data frames by
  dimensions
}

\section{Output}{

  The most unambiguous behaviour is achieved when \code{.fun} returns a
  data frame - in that case pieces will be combined with
  \code{\link{rbind.fill}}.  If \code{.fun} returns an atomic vector of
  fixed length, it will be \code{rbind}ed together and converted to a data
  frame. Any other values will result in an error.

 If there are no results, then this function will return a data
 frame with zero rows and columns (\code{data.frame()}).
}

\references{
Hadley Wickham (2011). The Split-Apply-Combine Strategy
  for Data Analysis. Journal of Statistical Software, 40(1), 1-29.
  \url{https://www.jstatsoft.org/v40/i01/}.
}
\seealso{
Other array input: 
\code{\link{a_ply}()},
\code{\link{aaply}()},
\code{\link{alply}()}

Other data frame output: 
\code{\link{ddply}()},
\code{\link{ldply}()},
\code{\link{mdply}()}
}
\concept{array input}
\concept{data frame output}
\keyword{manip}
