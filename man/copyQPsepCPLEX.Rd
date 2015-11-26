\name{copyQPsepCPLEX}
\alias{copyQPsepCPLEX}
\alias{CPXcopyqpsep}

\title{
  Copy the Quadratic Objective Matrix Q for a Separable QP Problem
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcopyqpsep}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  copyQPsepCPLEX(env, lp, qsepvec)
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
  \item{qsepvec}{
    A vector containing the quadratic coefficients.
  }
}

\details{
  Interface to the C function \code{copyQPsep} which calls the CPLEX
  function \code{CPXcopyqpsep}.
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


\keyword{ optimize }
