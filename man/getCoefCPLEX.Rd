\name{getCoefCPLEX}
\alias{getCoefCPLEX}
\alias{CPXgetcoef}

\title{
  Access a Single Constraint Matrix Coefficient
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetcoef}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getCoefCPLEX(env, lp, i, j)
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
  \item{i}{
	An integer specifying the numeric index of the row.
  }
  \item{j}{
	An integer specifying the numeric index of the column.
  }
}

\details{
  Interface to the C function \code{getCoef} which calls the CPLEX
  function \code{CPXgetcoef}.
}

\value{
  Matrix coefficient value if successful, otherwise an instance of class
  \code{"\linkS4class{cplexError}"}.
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
