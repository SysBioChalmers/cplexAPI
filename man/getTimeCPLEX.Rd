\name{getTimeCPLEX}
\alias{getTimeCPLEX}
\alias{CPXgettime}

\title{
  Get a Time Stamp
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXfclose}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getTimeCPLEX(env)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
}

\details{
  Interface to the C function \code{getTime} which calls the CPLEX
  function \code{CPXgettime}.
}

\value{
  If successful a single numeric value, otherwise an instance of class
  \code{"\linkS4class{cplexError}"}.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich

  Maintainer: Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>
}

\seealso{
  \code{\link{fileputCPLEX}}, \code{\link{openFileCPLEX}}
}

\keyword{ optimize }

