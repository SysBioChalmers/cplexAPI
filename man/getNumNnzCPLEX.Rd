\name{getNumNnzCPLEX}
\alias{getNumNnzCPLEX}
\alias{CPXgetnumnz}

\title{
	Access the Number of Nonzero Elements in the Constraint Matrix
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetnumnz}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getNumNnzCPLEX(env, lp)
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
  Interface to the C function \code{getNumNnz} which calls the CPLEX
  function \code{CPXgetnumnz}.
}

\value{
  Zero if the problem object or environment does not exist, otherwise the number
  of nonzero elements.
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
