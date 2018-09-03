\name{delQConstrsCPLEX}
\alias{delQConstrsCPLEX}
\alias{CPXdelqconstrs}

\title{
  Delete a Range of Quadratic Constraints
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXdelqconstrs}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  delQConstrsCPLEX(env, lp, begin, end)
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
    An integer that specifies the numeric index of the first quadratic constraint to be
    deleted.
  }
  \item{end}{
    An integer that specifies the numeric index of the last quadratic constraint to be
    deleted.
  }
}

\details{
  Interface to the C function \code{delQConstrs} which calls the CPLEX
  function \code{CPXdelqconstrs}.
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

