\name{readCopyProbCPLEX}
\alias{readCopyProbCPLEX}
\alias{CPXreadcopyprob}

\title{
  Read an MPS, LP, or SAV File Into an Existing CPLEX Problem Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXreadcopyprob}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  readCopyProbCPLEX(env, lp, fname, ftype = NULL)
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
    Single character value giving the filname to read from.
  }
  \item{ftype}{
    Single character value giving the type of the file to read from.
  }
}

\details{
  Interface to the C function \code{readCopyProb} which calls the CPLEX
  function \code{CPXreadcopyprob}.
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

