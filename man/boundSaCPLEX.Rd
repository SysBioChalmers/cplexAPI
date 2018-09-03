\name{boundSaCPLEX}
\alias{boundSaCPLEX}
\alias{CPXboundsa}

\title{
  Access Upper and Lower Sensitivity Ranges for Lower and Upper Variable Bounds
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXboundsa}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}
\usage{
  boundSaCPLEX(env, lp, begin, end)
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
    Beginning of the range of ranges to be returned.
  }
  \item{end}{
    End of the range of ranges to be returned.
  }
}

\details{
  Interface to the C function \code{boundSa} which calls the CPLEX
  function \code{CPXboundsa}.
}

\value{
  If successfull, a list will be returned:
  \item{lblower}{lower bound lower range values}
  \item{lbupper}{lower bound upper range values}
  \item{ublower}{upper bound lower range values}
  \item{ubupper}{upper bound upper range values}
  Otherwise an object of class \code{"\linkS4class{cplexError}"}.
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

