\name{chgNameCPLEX}
\alias{chgNameCPLEX}
\alias{CPXchgname}

\title{
  Change the Name of a Constraint a Variable in a CPLEX Problem Object.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgname}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  chgNameCPLEX(env, lp, key, ij, name)
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
  \item{key}{
	A character to specify whether a row name or a column name should be
	changed.
  }
  \item{ij}{
	An integer that specifies the numeric index of the column or row whose name
	is to be changed.
  }
  \item{name}{
	A pointer to a character string containing the new name.
  }
}

\details{
  Interface to the C function \code{chgName} which calls the CPLEX
  function \code{CPXchgname}.
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
