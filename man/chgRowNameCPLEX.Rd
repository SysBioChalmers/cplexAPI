\name{chgRowNameCPLEX}
\alias{chgRowNameCPLEX}
\alias{CPXchgrowname}

\title{
  Change Names of Linear Constraints
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgrowname}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  chgRowNameCPLEX(env, lp, nnames, ind, names)
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
	the columns specified in ind.
  }
}

\details{
  Interface to the C function \code{chgRowName} which calls the CPLEX
  function \code{CPXchgrowname}.
}

\value{
  Zero if successful, otherwise nonzero.
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
