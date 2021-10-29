\name{getStatStrCPLEX}
\alias{getStatStrCPLEX}
\alias{CPXgetstatstring}

\title{
  Return an Status Message String Corresponding to an Status Code
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetstatstring}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getStatStrCPLEX(env, stat)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{stat}{
    The status code to be translated.
  }
}

\details{
  Interface to the C function \code{getStatStr} which calls the CPLEX
  function \code{CPXgetstatstring}.
}

\value{
  A single character value containing the status message string.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/docs/en}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\seealso{
  \code{\link{getErrorStrCPLEX}}
}

\keyword{ optimize }

