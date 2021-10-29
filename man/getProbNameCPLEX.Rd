\name{getProbNameCPLEX}
\alias{getProbNameCPLEX}
\alias{CPXgetprobname}

\title{
  Access Problem Name
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetprobname}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
	getProbNameCPLEX(env, lp)
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
}

\details{
  Interface to the C function \code{getProbName} which calls the CPLEX
  function \code{CPXgetprobname}.
}

\value{
  Name of the problem if successful, otherwise an instance of class
  \code{"\linkS4class{cplexError}"}.
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
