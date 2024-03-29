\name{readCopyMIPstartsCPLEX}
\alias{readCopyMIPstartsCPLEX}
\alias{CPXreadcopymipstarts}

\title{
  Read a File in the Format MST
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXreadcopymipstarts}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  readCopyMIPstartsCPLEX(env, lp, fname)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{lp}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{initProbCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX problem object.
  }
  \item{fname}{
    Name of the file to read from.s
  }
}

\details{
  Interface to the C function \code{readCopyMIPstarts} which calls the CPLEX
  function \code{CPXreadcopymipstarts}.
}

\value{
  Zero if successful, otherwise nonzero.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/docs/en}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\keyword{ optimize }
