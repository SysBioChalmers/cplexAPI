\name{checkAddColsCPLEX}
\alias{checkAddColsCPLEX}
\alias{CPXcheckaddcols}

\title{
  Validate Arguments of the Corresponding \code{addColsCPLEX} Routine
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcheckaddcols}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  checkAddColsCPLEX(env, lp, ncols, nnz, objf, matbeg, matind, matval,
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
  Interface to the C function \code{checkAddCols} which calls the CPLEX
  function \code{CPXcheckaddcols}.
}

\value{
  Nonzero if it detects an error in the data; it returns zero if it does not
  detect any data errors.
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
  \code{\link{addColsCPLEX}}
}

\keyword{ optimize }

