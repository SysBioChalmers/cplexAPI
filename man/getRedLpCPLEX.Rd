\name{getRedLpCPLEX}
\alias{getRedLpCPLEX}
\alias{CPXgetredlp}

\title{
  Get a Pointer for the Presolved Problem
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetredlp}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getRedLpCPLEX(env, lp, ptrtype = "cplex_prob")
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
  \item{ptrtype}{
    A name for the pointer object.
  }
}

\details{
  Interface to the C function \code{getRedLp} which calls the CPLEX
  function \code{CPXgetredlp}.
}

\value{
  Pointer for the presolved problem if successful (an instance of class
  \code{"\linkS4class{cplexPtr}"}), otherwise an instance of
  class \code{"\linkS4class{cplexError}"} or \code{NULL}.
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
