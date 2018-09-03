\name{getRowsCPLEX}
\alias{getRowsCPLEX}
\alias{CPXgetrows}

\title{
  Accesses a Range of Rows of the Constraint Matrix
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetrows}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getRowsCPLEX(env, lp, begin, end)
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
	An integer specifying the beginning of the range of rows to be returned.
  }
  \item{end}{
	An integer specifying the end of the range of rows to be returned.
  }
}

\details{
  Interface to the C function \code{getRows} which calls the CPLEX
  function \code{CPXgetrows}.
}

\value{
  If successful a list is returned:
  \item{matbeg }{Array that specifies the nonzero elements of the rows.
                 Consult the IBM ILOG CPLEX documentation for more detailed
                 information.}
  \item{matind }{Array that specifies the nonzero elements of the rows.
                 Consult the IBM ILOG CPLEX documentation for more detailed
                 information.}
  \item{matval }{Array that specifies the nonzero elements of the rows.
                 Consult the IBM ILOG CPLEX documentation for more detailed
                 information.}
  otherwise an instance of class \code{"\linkS4class{cplexError}"}.
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
