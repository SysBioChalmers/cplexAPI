\name{copyQuadCPLEX}
\alias{copyQuadCPLEX}
\alias{CPXcopyquad}

\title{
  Copy a Quadratic Objective Matrix Q When Q is not Diagonal.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcopyquad}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  copyQuadCPLEX(env, lp, qmatbeg, qmatcnt, qmatind, qmatval)
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
  \item{qmatbeg}{
    Array that defines the constraint matrix. Consult the IBM ILOG CPLEX
    documentation for more detailed information.
  }
  \item{qmatcnt}{
    Array that defines the constraint matrix. Consult the IBM ILOG CPLEX
    documentation for more detailed information.
  }
  \item{qmatind}{
    Array that defines the constraint matrix. Consult the IBM ILOG CPLEX
    documentation for more detailed information.
  }
  \item{qmatval}{
    Array that defines the constraint matrix. Consult the IBM ILOG CPLEX
    documentation for more detailed information.
  }
}

\details{
  Interface to the C function \code{copyQuad} which calls the CPLEX
  function \code{CPXcopyquad}.
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
