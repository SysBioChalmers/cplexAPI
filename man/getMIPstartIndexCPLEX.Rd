\name{getMIPstartIndexCPLEX}
\alias{getMIPstartIndexCPLEX}
\alias{CPXgetmipstartindex}

\title{
  Search for the Index Number of the Specified MIP Start
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetmipstartindex}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getMIPstartIndexCPLEX(env, lp, iname)
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
  \item{iname}{
    A MIP start name to search for.
  }
}

\details{
  Interface to the C function \code{getMIPstartIndex} which calls the CPLEX
  function \code{CPXgetmipstartindex}.
}

\value{
  Index number of the specified MIP start if successful, otherwise an instance
  of class \code{"\linkS4class{cplexError}"}.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/docs/en}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\keyword{ optimize }
