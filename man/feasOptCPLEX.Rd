\name{feasOptCPLEX}
\alias{feasOptCPLEX}
\alias{CPXfeasopt}

\title{
  Compute a Minimum-Cost Relaxation
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXfeasopt}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  feasOptCPLEX(env, lp, rhs = FALSE, rng = FALSE, lb = FALSE, ub = FALSE)
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
  \item{rhs}{
    If set to \code{FALSE} no right hand side value is allowed to be relaxed.
  }
  \item{rng}{
    If set to \code{FALSE} no range values are allowed to be relaxed.
  }
  \item{lb}{
    If set to \code{FALSE} no lower bound of any variable is allowed to be
    relaxed.
  }
  \item{ub}{
    If set to \code{FALSE} no lower bound of any variable is allowed to be
    relaxed.
  }
}

\details{
  Interface to the C function \code{feasOpt} which calls the CPLEX
  function \code{CPXfeasopt}.
}

\value{
  Zero if successful, otherwise nonzero.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Claus Jonathan Fritzemeier <clausjonathan.fritzemeier@uni-duesseldorf.de>
}


\seealso{
  \code{\link{solutionCPLEX}}, \code{\link{getRowInfeasCPLEX}},
  \code{\link{getColInfeasCPLEX}}, \code{\link{solnInfoCPLEX}},
  \code{\link{getStatCPLEX}}
}

\keyword{ optimize }

