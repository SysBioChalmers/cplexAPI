\name{copyPartBaseCPLEX}
\alias{copyPartBaseCPLEX}
\alias{CPXcopypartialbase}

\title{
  Copies a partial basis into an LP problem object.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcopypartialbase}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}
\usage{
  copyPartBaseCPLEX(env, lp, ncind, cind, cstat, nrind, rind, rstat)
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
  \item{ncind}{
	An integer that specifies the number of variable or column status values
	specified.
  }
  \item{cind}{
	A vector that contains the indices of the variables for which status values
	are being specified.
  }
  \item{cstat}{
	A vector where the ith entry contains the status for variable
	\code{cind[i]}.
  }
  \item{nrind}{
	An integer that specifies the number of slack, surplus, or artificial status
	values specified.
  }
  \item{rind}{
	A vector rcnt that contains the indices of the slack, surplus, or artificial
	variables for which status values are being specified.
  }
  \item{rstat}{
	A vector of where the \code{i}-th entry contains the status for slack,
	surplus, or artificial \code{rind[i]}.
  }
}

\details{
  Interface to the C function \code{copyPartBase} which calls the CPLEX
  function \code{CPXcopypartialbase}.
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
