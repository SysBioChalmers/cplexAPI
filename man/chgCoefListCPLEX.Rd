\name{chgCoefListCPLEX}
\alias{chgCoefListCPLEX}
\alias{CPXchgcoeflist}

\title{
  Change a List of Matrix Coefficients of a CPLEX Problem Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgcoeflist}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
	chgCoefListCPLEX(env, lp, nnz, ia, ja, ra)
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
  \item{nnz}{
    Number of nonzero constraint coefficients.
  }
  \item{ia}{
	Row indices of the nonzero elements.
  }
  \item{ja}{
	Column indices of the nonzero elements.
  }
  \item{ra}{
	Nonzero elements.
  }
}

\details{
  Interface to the C function \code{chgcoeflist} which calls the CPLEX
  function \code{CPXchgcoeflist}.
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
