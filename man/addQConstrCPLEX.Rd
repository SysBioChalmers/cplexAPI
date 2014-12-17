\name{addQConstrCPLEX}
\alias{addQConstrCPLEX}
\alias{CPXaddqconstr}

\title{
  Add Quadratic Constraint to a Specified CPLEX Problem Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXaddqconstr}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  addQConstrCPLEX(env, lp, lzn, qzn, rhs, sense,
                  lind = NULL, lval = NULL,
                  qrow, qcol, qval, qname = NULL)
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
  \item{lzn}{
    Number of nonzero constraint coefficients in the linear part of the
    constraint.
  }
  \item{qzn}{
    Number of nonzero constraint coefficients in the quadratic part of the
    constraint.
  }
  \item{rhs}{
    Righthand side term.
  }
  \item{sense}{
    The sense of the constraint to be added.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
  \item{lind}{
    Linear part of the quadratic constraint to be added.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
  \item{lval}{
    Linear part of the constraint to be added.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
  \item{qrow}{
    Quadratic part of the quadratic constraint to be added.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
  \item{qcol}{
    Quadratic part of the quadratic constraint to be added.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
  \item{qval}{
    Quadratic part of the quadratic constraint to be added.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
  \item{qname}{
    Name of the constraint to be added.
  }
}

\details{
  Interface to the C function \code{addQConstr} which calls the CPLEX
  function \code{CPXaddqconstr}.
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

