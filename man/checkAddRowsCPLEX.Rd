\name{checkAddRowsCPLEX}
\alias{checkAddRowsCPLEX}
\alias{CPXcheckaddrows}

\title{
  Validate Arguments of the Corresponding \code{addRowsCPLEX} Routine
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcheckaddrows}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  checkAddRowsCPLEX(env, lp, ncols, nrows, nnz, matbeg, matind, matval,
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
  Interface to the C function \code{checkAddRows} which calls the CPLEX
  function \code{CPXcheckaddrows}.
}

\value{
  Nonzero if it detects an error in the data; it returns zero if it does not
  detect any data errors.
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
  \code{\link{addRowsCPLEX}}
}

\keyword{ optimize }

