\name{delIndConstrsCPLEX}
\alias{delIndConstrsCPLEX}
\alias{CPXdelindconstrs}

\title{
  Delete a Range of Indicator Constraints
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXdelindconstrs}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  delIndConstrsCPLEX(env, lp, begin, end)
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
    An integer that specifies the numeric index of the first indicator constraint to be
    deleted.
  }
  \item{end}{
    An integer that specifies the numeric index of the last indicator constraint to be
    deleted.
  }
}

\details{
  Interface to the C function \code{delIndConstrs} which calls the CPLEX
  function \code{CPXdelindconstrs}.
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

