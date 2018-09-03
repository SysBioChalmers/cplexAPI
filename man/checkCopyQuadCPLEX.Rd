\name{checkCopyQuadCPLEX}
\alias{checkCopyQuadCPLEX}
\alias{CPXcheckcopyquad}

\title{
  Validate Arguments of the Corresponding \code{checkCopyQuadCPLEX} Routine
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcheckcopyquad}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  checkCopyQuadCPLEX(env, lp, qmatbeg, qmatcnt, qmatind, qmatval)
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
  \item{qmatbeg}{
    Array that defines the constraint matrix. Consult the IBM ILOG CPLEX
    documentation for more detailed information.
  }
  \item{qmatcnt}{
    Array that defines the constraint matrix. Consult the IBM ILOG CPLEX
    documentation for more detailed information.
  }
  \item{qmatind}{
    Array that defines the constraint matrix. Consult the IBM ILOG CPLEX
    documentation for more detailed information.
  }
  \item{qmatval}{
    Array that defines the constraint matrix. Consult the IBM ILOG CPLEX
    documentation for more detailed information.
  }
}

\details{
  Interface to the C function \code{checkCopyQuad} which calls the CPLEX
  function \code{CPXcheckcopyquad}.
}

\value{
  Nonzero if it detects an error in the data; it returns zero if it does not
  detect any data errors.
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
  \code{\link{copyQuadCPLEX}}
}

\keyword{ optimize }
