\name{getSiftItCntCPLEX}
\alias{getSiftItCntCPLEX}
\alias{CPXgetsiftitcnt}

\title{
  Access Total Number of Sifting Iterations
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetsiftitcnt}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getSiftItCntCPLEX(env, lp)
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
  Interface to the C function \code{getSiftItCnt} which calls the CPLEX
  function \code{CPXgetsiftitcnt}.
}

\value{
  Zero if no solution exists, otherwise nonzero the total iteration count.
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
