\name{copyColTypeCPLEX}
\alias{copyColTypeCPLEX}
\alias{CPXcopyctype}

\title{
  Copy Variable Type Information Into a Given Problem
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgprobname}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  copyColTypeCPLEX(env, lp, xctype)
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
  \item{xctype}{
	A vector containing the type of each column in the constraint matrix.
  }
}

\details{
  Interface to the C function \code{copyColType} which calls the CPLEX
  function \code{CPXcopyctype}.
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


\keyword{ optimize }
