\name{chgColNameCPLEX}
\alias{chgColNameCPLEX}
\alias{CPXchgcolname}

\title{
  Change the Names of Variables in a CPLEX Problem Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgcolname}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  chgColNameCPLEX(env, lp, nnames, ind, names)
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
  \item{nnames}{
	A vector that specifies the total number of variable names to be changed.
  }
  \item{ind}{
	A vector containing the numeric indices indices of the variables for
	which the names are to be changed.
  }
  \item{names}{
	A vector containing the strings of the new variable names for
	the columns specified in \code{ind}.
  }
}
\details{
  Interface to the C function \code{chgColName} which calls the CPLEX
  function \code{CPXchgcolname}.
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
