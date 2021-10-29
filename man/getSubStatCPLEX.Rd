\name{getSubStatCPLEX}
\alias{getSubStatCPLEX}
\alias{CPXgetsubstat}
\title{
  Access Solution Status of the Last Subproblem Optimization
}
\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetsubstat}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getSubStatCPLEX(env, lp)
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
  Interface to the C function \code{getSubStat} which calls the CPLEX
  function \code{CPXgetsubstat}.
}

\value{
  Zero if no solution exists, nonzero otherwise.
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
