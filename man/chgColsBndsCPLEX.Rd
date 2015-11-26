\name{chgColsBndsCPLEX}
\alias{chgColsBndsCPLEX}

\title{
	Change Lower and Upper Bounds on a Set of Variables of a Problem
}

\description{
  Set lower and upper bounds on a set of variables in one step.
  If \code{lb[i] == ub[i]} the type of the bound is set to \code{"B"},
  otherwise \code{lb[i]} is set to \code{"L"} and \code{ub[i]} is set to
  \code{"U"}.
}

\usage{
  chgColsBndsCPLEX(env, lp, j, lb, ub)
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
  \item{j}{
    An integer that specifies the numeric index of the column in which the
    coefficient is located.
  }
  \item{lb}{
	A vector containing the lower bounds.
  }
  \item{ub}{
	A vector containing the upper bounds.
  }
}

\details{
  Interface to the C function \code{chgColsBnds} which calls the CPLEX
  function \code{CPXchgbds}.
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
  \code{\link{chgBndsCPLEX}}, \code{\link{tightenBndsCPLEX}}
}

\keyword{ optimize }
