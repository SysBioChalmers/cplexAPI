\name{getBaseCPLEX}
\alias{getBaseCPLEX}
\alias{CPXgetbase}

\title{
  Access Basis Resident in a CPLEX Problem Object.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetbase}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getBaseCPLEX(env, lp)
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
  Interface to the C function \code{getBase} which calls the CPLEX
  function \code{CPXgetbase}.
}

\value{
  If successful a list is returned:
  \item{cstat }{basis status of the columns in the CPLEX problem object}
  \item{rstat }{basis status of the artificial, slack, or surplus variable
                associated with each row in the constraint matrix}
  otherwise an instance of class \code{"\linkS4class{cplexError}"}.
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
