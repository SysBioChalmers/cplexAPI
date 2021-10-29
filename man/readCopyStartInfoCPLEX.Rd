\name{readCopyStartInfoCPLEX}
\alias{readCopyStartInfoCPLEX}
\alias{CPXreadcopystartinfo}

\title{
  Reads start information from a SOL format file, and copies that basis or solution into a CPLEX problem object.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXreadcopystartinfo}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information. This function has no functionality
  for IBM ILOG CPLEX < 20.1.0, where \code{CPXreadcopystartinfo} was not included.
}

\usage{
  readCopyStartInfoCPLEX(env, lp, fname)
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
    Single character value giving the name of the SOL format file from which the start information should be read.
  }
}

\details{
  Interface to the C function \code{readCopyStartInfo} which calls the CPLEX
  function \code{CPXreadcopystartinfo}.
}

\value{
  Zero if successful, otherwise nonzero.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/docs/en}.
}

\author{
  Mayo Roettger <mayo.roettger@hhu.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\keyword{ optimize }

