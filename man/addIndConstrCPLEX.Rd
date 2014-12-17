\name{addIndConstrCPLEX}
\alias{addIndConstrCPLEX}
\alias{CPXaddindconstr}

\title{
  Adds an Indicator Constraint to the Specified CPLEX Problem Object
}
\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXaddindconstr}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}
\usage{
  addIndConstrCPLEX(env, lp, indvar, complemented,
                    nzcnt, rhs, sense, linind, linval, indname = NULL)
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
  \item{indvar}{
    The binary variable that acts as the indicator for this constraint.
  }
  \item{complemented}{
    A Boolean value that specifies whether the indicator variable is complemented.
  }
  \item{nzcnt}{
    An integer that specifies the number of nonzero coefficients in the linear portion
    of the indicator constraint.
  }
  \item{rhs}{
    The righthand side value for the linear portion of the indicator constraint.
  }
  \item{sense}{
    The sense of the linear portion of the indicator constraint.
  }
  \item{linind}{
    A vector that with \code{linval} defines the linear portion of the indicator
    constraint.
  }
  \item{linval}{
    A vector that with linind defines the linear portion of the indicator constraint.
  }
  \item{indname}{
    The name of the constraint to be added (optional).
  }
}

\details{
  Interface to the C function \code{addIndConstr} which calls the CPLEX
  function \code{CPXaddindconstr}.
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

