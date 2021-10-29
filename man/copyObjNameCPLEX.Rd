\name{copyObjNameCPLEX}
\alias{copyObjNameCPLEX}
\alias{CPXcopyobjname}

\title{
  Copy a Name for the Objective Function Into a CPLEX Problem Object.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcopyobjname}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  copyObjNameCPLEX(env, lp, oname)
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
  \item{oname}{
	A pointer to a character string containing the objective name.
  }
}

\details{
  Interface to the C function \code{copyObjName} which calls the CPLEX
  function \code{CPXcopyobjname}.
}

\value{
  Zero if successful, otherwise nonzero.
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
