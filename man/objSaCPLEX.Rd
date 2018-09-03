\name{objSaCPLEX}
\alias{objSaCPLEX}
\alias{CPXobjsa}

\title{
  Access Upper and Lower Sensitivity Ranges for Objective Function Coefficients
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXobjsa}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  objSaCPLEX(env, lp, begin, end)
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
    Beginning of the range of ranges to be returned.
  }
  \item{end}{
    End of the range of ranges to be returned.
  }
}

\details{
  Interface to the C function \code{objSa} which calls the CPLEX
  function \code{CPXobjsa}.
}

\value{
  If successful a list is returned:
  \item{lower }{lower range values}
  \item{upper }{upper range values}
  otherwise an instance of class \code{"\linkS4class{cplexError}"}.
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

