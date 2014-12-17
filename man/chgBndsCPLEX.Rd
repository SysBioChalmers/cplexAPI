\name{chgBndsCPLEX}
\alias{chgBndsCPLEX}
\alias{CPXchgbds}

\title{
  Change the Lower or Upper Bounds on a Set of Variables of a Problem
}
\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgbds}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}
\usage{
  chgBndsCPLEX(env, lp, ncols, ind, lu, bd)
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
  \item{ncols}{
    Number of bounds to be changed.
  }
  \item{ind}{
    Indices of bounds to be changed.
  }
  \item{lu}{
    A character vector, specifying whether an entry in \code{bd} is a upper
    or a lower bound on variable \code{ind[j]}.
  }
  \item{bd}{
    Values of the lower or upper bounds of the variables present in \code{ind}.
  }
}

\details{
  Interface to the C function \code{chgBnds} which calls the CPLEX
  function \code{CPXchgbds}.
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

\seealso{
  \code{\link{getLowerBndsCPLEX}}, \code{\link{getUpperBndsCPLEX}}
}

\keyword{ optimize }

