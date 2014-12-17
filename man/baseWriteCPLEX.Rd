\name{baseWriteCPLEX}
\alias{baseWriteCPLEX}
\alias{CPXmbasewrite}

\title{
  Write the Most Current Basis Associated With a CPLEX Problem Object to a File
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXmbasewrite}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}
\usage{
  baseWriteCPLEX(env, lp, fname)
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
  \item{fname}{
    A filename.
  }
}

\details{
  Interface to the C function \code{baseWrite} which calls the CPLEX
  function \code{CPXmbasewrite}.
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

