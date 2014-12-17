\name{getProbVarCPLEX}
\alias{getProbVarCPLEX}
\alias{CPXgetx}

\title{
  Access the Solution Values for a Range of Problem Variables
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetx}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getProbVarCPLEX(env, lp, begin, end)
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
	An integer specifying the beginning of the range of variable
	values to be returned.
  }
  \item{end}{
	An integer specifying the end of the range of variable
	values to be returned.
  }
}

\details{
  Interface to the C function \code{getProbVar} which calls the CPLEX
  function \code{CPXgetx}.
}

\value{
  Values of the primal variables if successful, otherwise an instance of class
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
