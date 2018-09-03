\name{chgCoefCPLEX}
\alias{chgCoefCPLEX}
\alias{CPXchgcoef}

\title{
  Change a Single Coefficient in the Constraint Matrix, Linear Objective
  Coefficients, Righthand Side, or Ranges of a CPLEX Problem Object
}
\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgcoef}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}
\usage{
  chgCoefCPLEX(env, lp, i, j, val)
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
    An integer that specifies the numeric index of the row in which the
    coefficient is located. The linear objective row is referenced
    with \code{i = -1}.
  }
  \item{j}{
    An integer that specifies the numeric index of the column in which the
    coefficient is located. The RHS column is referenced with \code{j = -1}.
    The range value column is referenced with \code{j = -2}. If \code{j = -2}
    is specified and row \code{i} is not a ranged row, an error status is
    returned.
  }
  \item{val}{
    The new value for the coefficient being changed.
  }
}

\details{
  Interface to the C function \code{chgCoef} which calls the CPLEX
  function \code{CPXchgcoef}.
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
  \code{\link{getNumRowsCPLEX}}, \code{\link{getNumColsCPLEX}},
  \code{\link{chgObjCPLEX}}, \code{\link{chgRhsCPLEX}},
  \code{\link{chgRngValCPLEX}}
}

\keyword{ optimize }

