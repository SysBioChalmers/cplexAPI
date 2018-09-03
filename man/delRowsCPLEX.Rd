\name{delRowsCPLEX}
\alias{delRowsCPLEX}
\alias{CPXdelrows}

\title{
  Delete a Range of Rows
}
\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXdelrows}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  delRowsCPLEX(env, lp, begin, end)
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
    Integer value, numeric index of the first row to be deleted.
  }
  \item{end}{
    Integer value, numeric index of the last row to be deleted.
  }
}

\details{
  Interface to the C function \code{delRows} which calls the CPLEX
  function \code{CPXdelrows}.
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

