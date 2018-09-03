\name{baroptCPLEX}
\alias{baroptCPLEX}
\alias{CPXbaropt}

\title{
  Solve LP, QP or QCP Problem by Means of the Barrier Algorithm
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXbaropt}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  baroptCPLEX(env, lp)
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
  Interface to the C function \code{baropt} which calls the CPLEX
  function \code{CPXbaropt}.
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
  \code{\link{solutionCPLEX}}
}

\keyword{ optimize }

