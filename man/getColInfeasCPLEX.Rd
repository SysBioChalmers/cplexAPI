\name{getColInfeasCPLEX}
\alias{getColInfeasCPLEX}
\alias{CPXgetcolinfeas}

\title{
  Compute Infeasibility of a Given Solution for a Range of Variables
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetcolinfeas}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}
\usage{
  getColInfeasCPLEX(env, lp, begin, end, sol = NULL)
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
  \item{begin}{
	An integer specifying the beginning of the range of variables whose
	infeasibility is to be returned.
  }
  \item{end}{
	An integer specifying the end of the range of variables whose infeasibility
	is to be returned.
  }
  \item{sol}{
	The solution whose infeasibility is to be computed.
  }
}

\details{
  Interface to the C function \code{getColInfeas} which calls the CPLEX
  function \code{CPXgetcolinfeas}.
}

\value{
  infeasibility values if successful, otherwise an instance of class
  \code{"\linkS4class{cplexError}"}.
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
