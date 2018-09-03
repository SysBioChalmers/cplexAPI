\name{getPiCPLEX}
\alias{getPiCPLEX}
\alias{CPXgetpi}

\title{
  Access Dual Values for a Range of Constraints
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetpi}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getPiCPLEX(env, lp, begin, end)
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
  \item{begin}{
	An integer specifying the beginning of the range of dual values to be returned.
  }
  \item{end}{
	An integer specifying the end of the range of dual values to be returned.
  }
}

\details{
  Interface to the C function \code{getPi} which calls the CPLEX
  function \code{CPXgetpi}.
}

\value{
  Values of the dual variables if successful, otherwise an instance of class
  \code{"\linkS4class{cplexError}"}.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/support/knowledgecenter/SSSA5P}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\keyword{ optimize }
