\name{getQConstrCPLEX}
\alias{getQConstrCPLEX}
\alias{CPXgetqconstr}

\title{
  Access a Specified Quadratic Constraint on the Variables of a CPLEX Problem Object.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetqconstr}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getQConstrCPLEX(env, lp, which)
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
    An integer specifying which quadratic constraint to return.
  }
}

\details{
  Interface to the C function \code{getQConstr} which calls the CPLEX
  function \code{CPXgetqconstr}.
}

\value{
  If successful a list is returned:
  \item{rhs    }{Righthand-side value of the quadratic constraint.
                 Consult the IBM ILOG CPLEX documentation for more detailed
                 information.}
  \item{sense  }{Character specifying the sense of the constraint.
                 Consult the IBM ILOG CPLEX documentation for more detailed
                 information.}
  \item{linind }{Variable indices of the entries of \code{linval}.
                 Consult the IBM ILOG CPLEX documentation for more detailed
                 information.}
  \item{linval }{Linear coefficients of the specified constraint.
                 Consult the IBM ILOG CPLEX documentation for more detailed
                 information.}
  \item{quadrow }{Variable indices of the entries of \code{quadval}.
                 Consult the IBM ILOG CPLEX documentation for more detailed
                 information.}
  \item{quadcol }{Variable indices of the entries of \code{quadval}.
                 Consult the IBM ILOG CPLEX documentation for more detailed
                 information.}
  \item{quadval }{Quadratic coefficients of the specified constraint.
                 Consult the IBM ILOG CPLEX documentation for more detailed
                 information.}
  otherwise an instance of class \code{"\linkS4class{cplexError}"}.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Claus Jonathan Fritzemeier <clausjonathan.fritzemeier@uni-duesseldorf.de>
}


\keyword{ optimize }

