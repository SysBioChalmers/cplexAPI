\name{getObjDirCPLEX}
\alias{getObjDirCPLEX}
\alias{CPXgetobjsen}

\title{
  Access the Direction of Optimization
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetobjsen}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
	getObjDirCPLEX(env, lp)
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
  Interface to the C function \code{getObjDir} which calls the CPLEX
  function \code{CPXgetobjsen}.
}

\value{
  Zero if the problem object or environment does not exist, otherwise nonzero.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/docs/en}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\seealso{
  \code{\link{cplexConstants}}
}

\keyword{ optimize }
