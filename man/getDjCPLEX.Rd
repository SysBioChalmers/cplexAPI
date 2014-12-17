\name{getDjCPLEX}
\alias{getDjCPLEX}
\alias{CPXgetdj}

\title{
  Accesses Reduced Costs for a Range of Variables of a Linear or Quadratic
  Program
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetdj}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getDjCPLEX(env, lp, begin, end)
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
	An integer specifying the beginning of the range of reduced-cost values to
	be returned.
  }
  \item{end}{
	An integer specifying the end of the range of reduced-costs values to be
	returned.
  }
}

\details{
  Interface to the C function \code{getDj} which calls the CPLEX
  function \code{CPXgetdj}.
}

\value{
  Reduced costs if successful, otherwise an instance of class
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
