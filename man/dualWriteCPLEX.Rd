\name{dualWriteCPLEX}
\alias{dualWriteCPLEX}
\alias{CPXdualwrite}

\title{
  Write a Dual Formulation of the Current CPLEX Problem Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXdualwrite}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  dualWriteCPLEX(env, lp, fname)
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
  Interface to the C function \code{dualWrite} which calls the CPLEX
  function \code{CPXdualwrite}.
}

\value{
  Zero if successful, otherwise an instance of class \code{"\linkS4class{cplexError}"}.
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

