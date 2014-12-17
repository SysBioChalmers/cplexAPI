\name{getRowNameCPLEX}
\alias{getRowNameCPLEX}
\alias{CPXgetrowname}

\title{
	Access a Range of Row Names
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetrowname}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getRowNameCPLEX(env, lp, begin, end)
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
	An integer specifying the beginning of the range of
	row names to be returned.
  }
  \item{end}{
	An integer specifying the end of the range of
	row names to be returned.
  }
}

\details{
  Interface to the C function \code{getRowName} which calls the CPLEX
  function \code{CPXgetrowname}.
}

\value{
  Specified row names if successful, otherwise an instance of class
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

\keyword{ optimize }
