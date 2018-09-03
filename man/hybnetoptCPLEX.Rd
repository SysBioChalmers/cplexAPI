\name{hybnetoptCPLEX}
\alias{hybnetoptCPLEX}
\alias{CPXhybnetopt}

\title{
  Use CPLEX Network Optimizer
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXhybnetopt}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  hybnetoptCPLEX(env, lp, method)
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
  \item{method}{
    A single integer value giving the type of simplex method to follow the
    network optimization.
  }
}

\details{
  Interface to the C function \code{hybnetopt} which calls the CPLEX
  function \code{CPXhybnetopt}.
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


\seealso{
  \code{\link{solnInfoCPLEX}}, \code{\link{getStatCPLEX}},
  \code{\link{solutionCPLEX}}, \code{\link{cplexConstants}} section
  \dQuote{LP/QP solution algorithms}.
}

\keyword{ optimize }

