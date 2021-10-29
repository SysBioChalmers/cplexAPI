\name{newColsCPLEX}
\alias{newColsCPLEX}
\alias{CPXnewcols}

\title{
  Add Empty Columns to a Specified CPLEX Problem Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXnewcols}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
newColsCPLEX(env, lp, ncols,
             obj = NULL, lb = NULL, ub = NULL,
             xctype = NULL, cnames = NULL)
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
    Number of variables to add.
  }
  \item{obj}{
    Objective function coefficients.
  }
  \item{lb}{
    Lower bounds on the new variables.
  }
  \item{ub}{
    Upper bounds on the new variables.
  }
  \item{xctype}{
    Type of the new variables.
  }
  \item{cnames}{
    Names of the new variables.
  }
}

\details{
  Interface to the C function \code{newCols} which calls the CPLEX
  function \code{CPXnewcols}.
}

\value{
  Zero if successful, otherwise nonzero.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/docs/en}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\seealso{
  \code{\link{cplexConstants}} section \dQuote{Variable types for ctype array}.
}

\keyword{ optimize }

