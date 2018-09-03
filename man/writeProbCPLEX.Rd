\name{writeProbCPLEX}
\alias{writeProbCPLEX}
\alias{CPXwriteprob}

\title{
  Write a CPLEX Problem Object to File
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXwriteprob}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  writeProbCPLEX(env, lp, fname, ftype = NULL)
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
    Single character value giving the file name to write to.
  }
  \item{ftype}{
    Single character value giving the type of the file to write to.
  }
}

\details{
  Interface to the C function \code{writeProb} which calls the CPLEX
  function \code{CPXwriteprob}.
}

\value{
  Zero if successful, otherwise nonzero.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/support/knowledgecenter/SSSA5P}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\keyword{ optimize }

