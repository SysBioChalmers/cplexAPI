\name{newRowsCPLEX}
\alias{newRowsCPLEX}
\alias{CPXnewrows}

\title{
  Add Empty Constraints to a Specified CPLEX Problem Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXnewrows}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  newRowsCPLEX(env, lp,
               nrows, rhs = NULL, sense = NULL,
               rngval = NULL, rnames = NULL)
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
  \item{nrows}{
    Number of new rows.
  }
  \item{rhs}{
    Right hand side term for each new constraint.
  }
  \item{sense}{
    Sense of each new constraint (see IBM ILOG CPLEX documentation for possible
    values).
  }
  \item{rngval}{
    Range values for each new constraint.
  }
  \item{rnames}{
    Names for the new rows.
  }
}

\details{
  Interface to the C function \code{newRows} which calls the CPLEX
  function \code{CPXnewrows}.
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

