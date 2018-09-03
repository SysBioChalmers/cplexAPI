\name{chgColTypeCPLEX}
\alias{chgColTypeCPLEX}
\alias{CPXchgctype}

\title{
  Change Types of a Set of Variables of a CPLEX Problem Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgctype}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  chgColTypeCPLEX(env, lp, ncols, ind, xctype)
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
  \item{ncols}{
    Number of bounds to be changed.
  }
  \item{ind}{
    Indices of bounds to be changed.
  }
  \item{xctype}{
	A vector containing characters that represent the new types for the columns
	specified in indices.
  }
}

\details{
  Interface to the C function \code{chgColType} which calls the CPLEX
  function \code{CPXchgctype}.
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
