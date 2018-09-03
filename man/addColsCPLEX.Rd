\name{addColsCPLEX}
\alias{addColsCPLEX}
\alias{CPXaddcols}

\title{
  Adds Columns to a Specified CPLEX Problem Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXaddcols}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  addColsCPLEX(env, lp, ncols, nnz, objf, matbeg, matind, matval,
               lb = NULL, ub = NULL, cnames = NULL)
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
    Number of columns.
  }
  \item{nnz}{
    Number of nonzero constraint coefficients.
  }
  \item{objf}{
    Objective function coefficients.
  }
  \item{matbeg}{
    Array that specifies the nonzero elements of the columns being added.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
  \item{matind}{
    Array that specifies the nonzero elements of the columns being added.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
  \item{matval}{
    Array that specifies the nonzero elements of the columns being added.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
  \item{lb}{
    Lower bounds of the new variables.
  }
  \item{ub}{
    Upper bounds of the new variables.
  }
  \item{cnames}{
    Names of the new variables.
  }
}

\details{
  Interface to the C function \code{addCols} which calls the CPLEX
  function \code{CPXaddcols}.
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
  \code{\link{checkAddColsCPLEX}}, \code{\link{addRowsCPLEX}}
}

\keyword{ optimize }

