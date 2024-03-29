\name{chgProbNameCPLEX}
\alias{chgProbNameCPLEX}
\alias{CPXchgprobname}

\title{
  Change the Name of the Current Problem.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgprobname}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  chgProbNameCPLEX(env, lp, probname)
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
  \item{probname}{
	The new name of the problem.
  }
}

\details{
  Interface to the C function \code{chgProbName} which calls the CPLEX
  function \code{CPXchgprobname}.
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
