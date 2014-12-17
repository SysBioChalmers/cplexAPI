\name{cleanupCoefCPLEX}
\alias{cleanupCoefCPLEX}
\alias{CPXcleanup}

\title{
  change Problem Coefficients to Zero That are Smaller in Magnitude Than the
  Tolerance Specified in the Argument eps
}
\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcleanup}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  cleanupCoefCPLEX(env, lp, eps)
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
  \item{eps}{
    Single numeric value giving the tolerance.
  }
}

\details{
  Interface to the C function \code{cleanupCoef} which calls the CPLEX
  function \code{CPXcleanup}.
}

\value{
  Zero if successful, otherwise nonzero.
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

