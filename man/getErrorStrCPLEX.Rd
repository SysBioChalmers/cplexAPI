\name{getErrorStrCPLEX}
\alias{getErrorStrCPLEX}
\alias{CPXgeterrorstring}

\title{
  Return an Error Message String Corresponding to an Error Code
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgeterrorstring}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}
\usage{
  getErrorStrCPLEX(err, env = NULL)
}

\arguments{
  \item{err}{
    The error code to be translated.
  }
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
}

\details{
  Interface to the C function \code{getErrorStr} which calls the CPLEX
  function \code{CPXgeterrorstring}.
}

\value{
  A single character value containing the error message string.
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
  \code{\link{getStatStrCPLEX}}
}

\keyword{ optimize }

