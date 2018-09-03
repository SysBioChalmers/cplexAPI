\name{copyStartCPLEX}
\alias{copyStartCPLEX}
\alias{CPXcopystart}

\title{
  Provides Starting Information for Use in a Subsequent Call to a
  Simplex Optimization Routine.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcopystart}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  copyStartCPLEX(env, lp,
                 cstat = NULL, rstat = NULL,
                 cprim = NULL, rprim = NULL,
                 cdual = NULL, rdual = NULL)
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
	A vector containing the basis status of the slack, surplus, or artificial
	variable associated with each row in the constraint matrix.
  }
  \item{cprim}{
	A vector containing the initial primal values of the column variables.
  }
  \item{rprim}{
	A vector containing the initial primal values of the slack (row) variables.
  }
  \item{cdual}{
	A vector containing the initial values of the reduced costs for the column
	variables.
  }
  \item{rdual}{
	A vector containing the initial values of the dual variables for the rows.
  }
}

\details{
  Interface to the C function \code{copyStart} which calls the CPLEX
  function \code{CPXcopyStart}.
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
