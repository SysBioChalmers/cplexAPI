\name{getItCntCPLEX}
\alias{getItCntCPLEX}
\alias{CPXgetitcnt}

\title{
  Access the Total Number of Simplex Iterations to Solve an LP Problem
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetitcnt}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getItCntCPLEX(env, lp)
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
  Interface to the C function \code{getItCnt} which calls the CPLEX
  function \code{CPXgetitcnt}.
}

\value{
  Total iteration count if  solution exists, otherwise zero.
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
