\name{solWriteCPLEX}
\alias{solWriteCPLEX}
\alias{CPXsolwrite}

\title{
  Write a Solution File
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXsolwrite}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  solWriteCPLEX(env, lp, fname)
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
    Single character value giving the filname to write to.
  }
}

\details{
  Interface to the C function \code{solWrite} which calls the CPLEX
  function \code{CPXsolwrite}.
}

\value{
  Zero if successful, otherwise nonzero.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/docs/en}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\seealso{
  \code{\link{getProbTypeCPLEX}},
  \code{\link{cplexConstants}} section \dQuote{Problem Types}.
}

\keyword{ optimize }

