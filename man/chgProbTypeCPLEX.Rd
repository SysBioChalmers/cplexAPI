\name{chgProbTypeCPLEX}
\alias{chgProbTypeCPLEX}
\alias{CPXchgprobtype}

\title{
  Change the Current Problem to a Related Problem
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgprobtype}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  chgProbTypeCPLEX(env, lp, ptype)
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
  \item{ptype}{
    A single integer value specifying the problem type.
  }
}

\details{
  Interface to the C function \code{chgProbType} which calls the CPLEX
  function \code{CPXchgprobtype}.
}

\value{
  Zero if successful, otherwise nonzero.
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
  \code{\link{getProbTypeCPLEX}},
  \code{\link{cplexConstants}} section \dQuote{Problem Types}.
}

\keyword{ optimize }

