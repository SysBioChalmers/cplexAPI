\name{checkValsCPLEX}
\alias{checkValsCPLEX}
\alias{CPXcheckvals}

\title{
  Check an Array of Indices and a Corresponding Array of Values for Input Errors
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcheckvals}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}
\usage{
  checkValsCPLEX(env, lp, nval, rind = NULL, cind = NULL, val = NULL)
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
  \item{nval}{
    Number of values to be examined.
  }
  \item{rind}{
    Row indices.
  }
  \item{cind}{
    Column indices.
  }
  \item{val}{
    The values itself.
  }
}

\details{
  Interface to the C function \code{checkVals} which calls the CPLEX
  function \code{CPXcheckvals}.
}

\value{
  Zero if successful, otherwise nonzero.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Claus Jonathan Fritzemeier <clausjonathan.fritzemeier@uni-duesseldorf.de>
}


\keyword{ optimize }
