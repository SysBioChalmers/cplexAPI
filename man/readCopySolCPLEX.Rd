\name{readCopySolCPLEX}
\alias{readCopySolCPLEX}
\alias{CPXreadcopysol}

\title{
  Reads a Solution From a SOL Format File
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXreadcopysol}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  readCopySolCPLEX(env, lp, fname)
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
}

\details{
  Interface to the C function \code{readCopySol} which calls the CPLEX
  function \code{CPXreadcopysol}.
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

