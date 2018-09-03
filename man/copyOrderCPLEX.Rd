\name{copyOrderCPLEX}
\alias{copyOrderCPLEX}
\alias{CPXcopyorder}

\title{
  Copy Priority Order to CPLEX Problem Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcopyorder}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  copyOrderCPLEX(env, lp, cnt, indices, priority = NULL, direction = NULL)
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
  \item{cnt}{
    Number of entries.
  }
  \item{indices}{
    Indices of the columns corresponding to the integer variables that are
    assigned priorities.
  }
  \item{priority}{
    Priorities assigned to the integer variables.
  }
  \item{direction}{
    Branching direction assigned to the integer variables.
  }
}

\details{
  Interface to the C function \code{copyOrder} which calls the CPLEX
  function \code{CPXcopyorder}.
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


\keyword{ optimize }
