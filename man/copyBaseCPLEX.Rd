\name{copyBaseCPLEX}
\alias{copyBaseCPLEX}
\alias{CPXcopybase}

\title{
  Copies a Basis Into a CPLEX Problem Object.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcopybase}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  copyBaseCPLEX(env, lp, cstat, rstat)
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
  \item{cstat}{
	A vector containing the basis status of the columns in the constraint
	matrix.
  }
  \item{rstat}{
	A vector containing the basis status of the slack, or surplus,
	or artificial variable associated with each row in the constraint matrix.
  }
}

\details{
  Interface to the C function \code{copyBase} which calls the CPLEX
  function \code{CPXcopybase}.
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
