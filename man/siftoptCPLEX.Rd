\name{siftoptCPLEX}
\alias{siftoptCPLEX}
\alias{CPXsiftopt}

\title{
  Solve a Reduced Model
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXsiftopt}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  siftoptCPLEX(env, lp)
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
}

\details{
  Interface to the C function \code{siftopt} which calls the CPLEX
  function \code{CPXsiftopt}.
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

