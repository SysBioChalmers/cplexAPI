\name{getRngValCPLEX}
\alias{getRngValCPLEX}
\alias{CPXgetrngval}

\title{
	Accesses Righthand Side Coefficients Range Coefficients
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetrngval}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getRngValCPLEX(env, lp, begin, end)
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
	An integer specifying the beginning of the set of rows for
	which RHS range coefficients are returned.
  }
  \item{end}{
	An integer specifying the end of the set of rows for
	which RHS range coefficients are returned.
  }
}

\details{
  Interface to the C function \code{getRngVal} which calls the CPLEX
  function \code{CPXgetrngval}.
}

\value{
  Specified RHS range coefficients if successful, otherwise an instance of
  class \code{"\linkS4class{cplexError}"}.
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
