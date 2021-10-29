\name{delSetColsCPLEX}
\alias{delSetColsCPLEX}
\alias{CPXdelsetcols}

\title{
  Delete a Set of Columns
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXdelsetcols}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  delSetColsCPLEX(env, lp, delstat)
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
  \item{delstat}{
    An array specifying the columns to be deleted.
  }
}

\details{
  Interface to the C function \code{delSetCols} which calls the CPLEX
  function \code{CPXdelsetcols}.
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

