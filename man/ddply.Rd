% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ddply.r
\name{ddply}
\alias{ddply}
\title{Split data frame, apply function, and return results in a data frame.}
\usage{
ddply(
  .data,
  .variables,
  .fun = NULL,
  ...,
  .progress = "none",
  .inform = FALSE,
  .drop = TRUE,
  .parallel = FALSE,
  .paropts = NULL
)
}
\arguments{
\item{.data}{data frame to be processed}

\item{.variables}{variables to split data frame by, as \code{\link{as.quoted}}
variables, a formula or character vector}

\item{.fun}{function to apply to each piece}

\item{...}{other arguments passed on to \code{.fun}}

\item{.progress}{name of the progress bar to use, see
\code{\link{create_progress_bar}}}

\item{.inform}{produce informative error messages?  This is turned off
by default because it substantially slows processing speed, but is very
useful for debugging}

\item{.drop}{should combinations of variables that do not appear in the
input data be preserved (FALSE) or dropped (TRUE, default)}

\item{.parallel}{if \code{TRUE}, apply function in parallel, using parallel
backend provided by foreach}

\item{.paropts}{a list of additional options passed into
the \code{\link[foreach]{foreach}} function when parallel computation
is enabled.  This is important if (for example) your code relies on
external data or packages: use the \code{.export} and \code{.packages}
arguments to supply them so that all cluster nodes have the correct
environment set up for computing.}
}
\value{
A data frame, as described in the output section.
}
\description{
For each subset of a data frame, apply function then combine results into a
data frame.
To apply a function for each row, use \code{\link{adply}} with
\code{.margins} set to \code{1}.
}
\section{Input}{
 This function splits data frames by variables.
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

\examples{
# Summarize a dataset by two variables
dfx <- data.frame(
  group = c(rep('A', 8), rep('B', 15), rep('C', 6)),
  sex = sample(c("M", "F"), size = 29, replace = TRUE),
  age = runif(n = 29, min = 18, max = 54)
)

# Note the use of the '.' function to allow
# group and sex to be used without quoting
ddply(dfx, .(group, sex), summarize,
 mean = round(mean(age), 2),
 sd = round(sd(age), 2))

# An example using a formula for .variables
ddply(baseball[1:100,], ~ year, nrow)
# Applying two functions; nrow and ncol
ddply(baseball, .(lg), c("nrow", "ncol"))

# Calculate mean runs batted in for each year
rbi <- ddply(baseball, .(year), summarise,
  mean_rbi = mean(rbi, na.rm = TRUE))
# Plot a line chart of the result
plot(mean_rbi ~ year, type = "l", data = rbi)

# make new variable career_year based on the
# start year for each player (id)
base2 <- ddply(baseball, .(id), mutate,
 career_year = year - min(year) + 1
)
}
\references{
Hadley Wickham (2011). The Split-Apply-Combine Strategy
  for Data Analysis. Journal of Statistical Software, 40(1), 1-29.
  \url{https://www.jstatsoft.org/v40/i01/}.
}
\seealso{
\code{\link{tapply}} for similar functionality in the base package

Other data frame input: 
\code{\link{d_ply}()},
\code{\link{daply}()},
\code{\link{dlply}()}

Other data frame output: 
\code{\link{adply}()},
\code{\link{ldply}()},
\code{\link{mdply}()}
}
\concept{data frame input}
\concept{data frame output}
\keyword{manip}
