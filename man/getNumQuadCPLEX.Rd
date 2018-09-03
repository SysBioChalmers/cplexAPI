\name{getNumQuadCPLEX}
\alias{getNumQuadCPLEX}
\alias{CPXgetnumquad}

\title{
  Return the Number of Variables That Have Quadratic Objective Coefficients
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetnumquad}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getNumQuadCPLEX(env, lp)
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
  Interface to the C function \code{getNumQuad} which calls the CPLEX
  function \code{CPXgetnumquad}.
}

\value{
  If successful the number of variables that have quadratic objective
  coefficients is returned. If \code{env} or \code{lp} do not exist, zero is
  returned.
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
