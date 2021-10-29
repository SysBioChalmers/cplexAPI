\name{getLogFileNameCPLEX}
\alias{getLogFileNameCPLEX}
\alias{CPXgetlogfilename}

\title{
  Get the name of the current logfile
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetlogfilename}. Consult the IBM ILOG CPLEX documentation for
  more detailed information. This funtion has no functionality
  for IBM ILOG CPLEX < 12.8.0, where \code{CPXgetlogfilename} was not included.
}

\usage{
  getLogFileNameCPLEX(env)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
}

\details{
  Interface to the C function \code{getLogFileName} which calls the CPLEX
  function \code{CPXgetlogfilename}.
}

\value{
  Zero if successful, otherwise nonzero.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/docs/en}.
}

\author{
  Mayo Roettger <mayo.roettger@hhu.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\seealso{
  \code{\link{cplexConstants}}
}

\keyword{ optimize }

