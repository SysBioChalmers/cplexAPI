\name{checkChgCoefListCPLEX}
\alias{checkChgCoefListCPLEX}
\alias{CPXcheckchgcoeflist}

\title{
  Validate Arguments of the Corresponding \code{chgCoefListCPLEX} Routine
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcheckchgcoeflist}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  checkChgCoefListCPLEX(env, lp, nnz, ia, ja, ra)
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
  Interface to the C function \code{checkChgCoefList} which calls the CPLEX
  function \code{CPXcheckchgcoeflist}.
}

\value{
  Nonzero if it detects an error in the data; it returns zero if it does not
  detect any data errors.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Claus Jonathan Fritzemeier <clausjonathan.fritzemeier@uni-duesseldorf.de>
}


\seealso{
  \code{\link{chgCoefListCPLEX}}
}

\keyword{ optimize }

