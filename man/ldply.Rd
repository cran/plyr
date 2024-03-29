% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ldply.r
\name{ldply}
\alias{ldply}
\title{Split list, apply function, and return results in a data frame.}
\usage{
ldply(
  .data,
  .fun = NULL,
  ...,
  .progress = "none",
  .inform = FALSE,
  .parallel = FALSE,
  .paropts = NULL,
  .id = NA
)
}
\arguments{
\item{.data}{list to be processed}

\item{.fun}{function to apply to each piece}

\item{...}{other arguments passed on to \code{.fun}}

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

\item{.id}{name of the index column (used if \code{.data} is a named list).
Pass \code{NULL} to avoid creation of the index column. For compatibility,
omit this argument or pass \code{NA} to avoid converting the index column
to a factor; in this case, \code{".id"} is used as colum name.}
}
\value{
A data frame, as described in the output section.
}
\description{
For each element of a list, apply function then combine results into a data
frame.
}
\section{Input}{
 This function splits lists by elements.
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
Other list input: 
\code{\link{l_ply}()},
\code{\link{laply}()},
\code{\link{llply}()}

Other data frame output: 
\code{\link{adply}()},
\code{\link{ddply}()},
\code{\link{mdply}()}
}
\concept{data frame output}
\concept{list input}
\keyword{manip}
