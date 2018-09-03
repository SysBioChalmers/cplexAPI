\name{chgQPcoefCPLEX}
\alias{chgQPcoefCPLEX}
\alias{CPXchgqpcoef}

\title{
  Change a Single Coefficient in the Quadratic Objective of a Quadratic Problem
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgqpcoef}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}
\usage{
  chgQPcoefCPLEX(env, lp, i, j, val)
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
  \item{i}{
    The first variable number.
  }
  \item{j}{
    The second variable number.
  }
  \item{val}{
    The new coefficient value.
  }
}

\details{
  Interface to the C function \code{chgQPcoef} which calls the CPLEX
  function \code{CPXchgqpcoef}.
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


\seealso{
  \code{\link{chgCoefCPLEX}}
}

\keyword{ optimize }

