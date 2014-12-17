\name{addRowsCPLEX}
\alias{addRowsCPLEX}
\alias{CPXaddrows}

\title{
  Add Constraints to a Specified CPLEX Problem Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXaddrows}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  addRowsCPLEX(env, lp, ncols, nrows, nnz, matbeg, matind, matval,
                         rhs = NULL, sense = NULL,
                         cnames = NULL, rnames = NULL)
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
    Number of new columns in the constraints being added to the constraint
    matrix.
  }
  \item{nrows}{
    Number of rows.
  }
  \item{nnz}{
    Number of nonzero constraint coefficients.
  }
  \item{matbeg}{
    An array used with rmatind and rmatval to define the rows to be added.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
  \item{matind}{
    An array used with rmatind and rmatval to define the rows to be added.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
  \item{matval}{
    An array used with rmatind and rmatval to define the rows to be added.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
  \item{rhs}{
    Righthand side term for each constraint to be added.
  }
  \item{sense}{
    Sense of each constraint to be added.
  }
  \item{cnames}{
    Names of the new columns.
  }
  \item{rnames}{
    Names of the new rows.
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
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich

  Maintainer: Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>
}

\seealso{
  \code{\link{checkAddRowsCPLEX}}, \code{\link{addColsCPLEX}},
  \code{\link{copyLpCPLEX}}, \code{\link{chgRngValCPLEX}}
}

\keyword{ optimize }

