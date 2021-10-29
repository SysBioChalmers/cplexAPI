\name{checkCopyLpCPLEX}
\alias{checkCopyLpCPLEX}
\alias{CPXcheckcopylp}

\title{
  Validate Arguments of the Corresponding \code{copyLpCPLEX} Routine
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcheckcopylp}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  checkCopyLpCPLEX(env, lp, nCols, nRows, lpdir, objf, rhs, sense,
                   matbeg, matcnt, matind, matval, lb, ub, rngval = NULL)
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
  \item{nCols}{
    Number of columns in the constraint matrix.
  }
  \item{nRows}{
	Number of rows in the constraint matrix.
  }
  \item{lpdir}{
    Single integer value that specifies whether the problem is a minimization
    or maximization problem.
  }
  \item{objf}{
    The objective function coefficients.
  }
  \item{rhs}{
	The righthand side values for each constraint in the constraint matrix.
  }
  \item{sense}{
	The sense of each constraint in the constraint matrix.
  }
  \item{matbeg}{
    Array that defines the constraint matrix. Consult the IBM ILOG CPLEX
    documentation for more detailed information.
  }
  \item{matcnt}{
    Array that defines the constraint matrix. Consult the IBM ILOG CPLEX
    documentation for more detailed information.
  }
  \item{matind}{
    Array that defines the constraint matrix. Consult the IBM ILOG CPLEX
    documentation for more detailed information.
  }
  \item{matval}{
    Array that defines the constraint matrix. Consult the IBM ILOG CPLEX
    documentation for more detailed information.
  }
  \item{lb}{
	Containing the lower bound on each of the variables.
  }
  \item{ub}{
	Containing the lower bound on each of the variables.
  }
  \item{rngval}{
	Containing the range value of each ranged constraint.
  }
}

\details{
  Interface to the C function \code{checkCopyLp} which calls the CPLEX
  function \code{CPXcheckcopylp}.
}

\value{
  Nonzero if it detects an error in the data; it returns zero if it does not
  detect any data errors.
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
  \code{\link{copyLpCPLEX}}
}

\keyword{ optimize }
