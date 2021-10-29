\name{getProbTypeCPLEX}
\alias{getProbTypeCPLEX}
\alias{CPXgetprobtype}

\title{
  Access Problem Type
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetprobtype}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getProbTypeCPLEX(env, lp)
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
  Interface to the C function \code{getProbType} which calls the CPLEX
  function \code{CPXgetprobtype}.
}

\value{
  A single integer value specifying the problem type.
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
  \code{\link{chgProbTypeCPLEX}},
  \code{\link{cplexConstants}} section \dQuote{Problem Types}.
}

\keyword{ optimize }

