\name{setObjDirCPLEX}
\alias{setObjDirCPLEX}
\alias{CPXchgobjsen}

\title{
  Change the Sense of the Optimization for a Problem
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgobjsen}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  setObjDirCPLEX(env, lp, lpdir)
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
  \item{lpdir}{
    A single integer value specifying the sense of the problem.
  }
}

\details{
  Interface to the C function \code{setObjDir} which calls the CPLEX
  function \code{CPXchgobjsen}.
}

\value{
  \code{NULL}
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/support/knowledgecenter/SSSA5P}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\seealso{
  \code{\link{cplexConstants}} section \dQuote{Generic constants}.
}

\keyword{ optimize }
