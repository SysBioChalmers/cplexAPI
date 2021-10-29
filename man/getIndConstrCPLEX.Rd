\name{getIndConstrCPLEX}
\alias{getIndConstrCPLEX}
\alias{CPXgetindconstr}

\title{
  Access a Specified Indicator Constraint on the Variables of a CPLEX Problem Object.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetindconstr}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}
\usage{
  getIndConstrCPLEX(env, lp, which)
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
  \item{which}{
    An integer specifying which indicator constraint to return.
  }
}

\details{
  Interface to the C function \code{getIndConstr} which calls the CPLEX
  function \code{CPXgetindconstr}.
}

\value{
  If successful a list is returned:
  \item{indvar      }{Index of the binary indicator variable.
                      Consult the IBM ILOG CPLEX documentation for more detailed
                      information.}
  \item{complemented}{Boolean value that specifies whether the indicator variable is
                      complemented.  Consult the IBM ILOG CPLEX documentation for more
                      detailed information.}
  \item{rhs         }{Righthand side value of the linear portion of the indicator
                      constraint.  Consult the IBM ILOG CPLEX documentation for more
                      detailed information.}
  \item{sense       }{Sense of the linear portion of the constraint.
                      Consult the IBM ILOG CPLEX documentation for more detailed
                      information.}
  \item{linind      }{Variable indices of the entries of \code{linval}.
                      Consult the IBM ILOG CPLEX documentation for more detailed
                      information.}
  \item{linval      }{Coefficients of the linear portion of the specified indicator
                      constraint.  Consult the IBM ILOG CPLEX documentation for more
                      detailed information.}
  otherwise an instance of class \code{"\linkS4class{cplexError}"}.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/docs/en}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\keyword{ optimize }

