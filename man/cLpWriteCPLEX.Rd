\name{cLpWriteCPLEX}
\alias{cLpWriteCPLEX}
\alias{CPXclpwrite}

\title{
  Write an LP Format File Containing Identified Conflict
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXclpwrite}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
	cLpWriteCPLEX(env, lp, fname)
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
  \item{fname}{
	Single character value giving the filname to write to.
  }
}

\details{
  Interface to the C function \code{cLpWriteCPLEX} which calls the CPLEX
  function \code{CPXclpwrite}.
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
