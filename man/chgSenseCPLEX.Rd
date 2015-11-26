\name{chgSenseCPLEX}
\alias{chgSenseCPLEX}
\alias{CPXchgsense}

\title{
  Change Sense of a Set of Linear Constraints
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgsense}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  chgSenseCPLEX(env, lp, nrows, ind, sense)
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
  \item{nrows}{
	Number of bounds to be changed.
  }
  \item{ind}{
    Indices of bounds to be changed.
  }
  \item{sense}{
	A vector containing characters that tell the new sense of the linear
	constraints specified in \code{ind}.
  }
}

\details{
  Interface to the C function \code{chgSense} which calls the CPLEX
  function \code{CPXchgsense}.
}

\value{
  Zero if successful, otherwise nonzero.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Claus Jonathan Fritzemeier <clausjonathan.fritzemeier@uni-duesseldorf.de>
}


\keyword{ optimize }
