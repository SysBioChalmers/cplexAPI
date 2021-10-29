\name{getQuadCPLEX}
\alias{getQuadCPLEX}
\alias{CPXgetquad}

\title{
  Access a Range of Columns of the Matrix Q of a Model With a Quadratic
  Objective Function
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetquad}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}
\usage{
  getQuadCPLEX(env, lp, begin, end)
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
  \item{begin}{
	An integer specifying the beginning of the range of columns to be returned.
  }
  \item{end}{
	An integer specifying the end of the range of columns to be returned.
  }
}

\details{
  Interface to the C function \code{getQuad} which calls the CPLEX
  function \code{CPXgetquad}.
}

\value{
  If successful a list is returned:
  \item{qmatbeg }{Array that specifies the nonzero elements of the columns.
                 Consult the IBM ILOG CPLEX documentation for more detailed
                 information.}
  \item{qmatind }{Array that specifies the nonzero elements of the columns.
                 Consult the IBM ILOG CPLEX documentation for more detailed
                 information.}
  \item{qmatval }{Array that specifies the nonzero elements of the columns.
                 Consult the IBM ILOG CPLEX documentation for more detailed
                 information.}
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
