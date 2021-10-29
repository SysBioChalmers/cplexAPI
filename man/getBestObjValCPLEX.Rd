\name{getBestObjValCPLEX}
\alias{getBestObjValCPLEX}
\alias{CPXgetbestobjval}

\title{
  Access the Currently Best Known Bound of all the Remaining Open Nodes in a Branch-And-Cut Tree
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetbestobjval}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getBestObjValCPLEX(env, lp)
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
  Interface to the C function \code{getBestObjVal} which calls the CPLEX
  function \code{CPXgetbestobjval}.
}

\value{
  Objective value if successful, otherwise an instance of class
  \code{"\linkS4class{cplexError}"}.
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
