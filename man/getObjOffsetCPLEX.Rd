\name{getObjOffsetCPLEX}
\alias{getObjOffsetCPLEX}
\alias{CPXgetobjoffset}

\title{
  Objective Offset Between the Original Problem and the Presolved Problem.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetobjoffset}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getObjOffsetCPLEX(env, lp)
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
}

\details{
  Interface to the C function \code{getObjOffset} which calls the CPLEX
  function \code{CPXgetobjoffset}.
}

\value{
  Objective offset value if successful, otherwise an instance of class
  \code{"\linkS4class{cplexError}"}.
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
