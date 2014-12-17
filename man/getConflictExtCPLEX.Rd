\name{getConflictExtCPLEX}
\alias{getConflictExtCPLEX}
\alias{CPXgetconflictext}

\title{
  Get Conflict Status Codes
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetconflictext}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getConflictExtCPLEX(env, lp, begin, end)
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
  \item{begin}{
    The index of the first group.
  }
  \item{end}{
    The index of the last group.
  }
}

\details{
  Interface to the C function \code{getConflictExt} which calls the CPLEX
  function \code{CPXgetconflictext}.
}

\value{
  Specified values denoting the conflict status if successful, otherwise an
  instance of class \code{"\linkS4class{cplexError}"}.
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
