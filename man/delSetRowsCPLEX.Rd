\name{delSetRowsCPLEX}
\alias{delSetRowsCPLEX}
\alias{CPXdelsetrows}

\title{
  Delete a Set of Rows
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXdelsetrows}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  delSetRowsCPLEX(env, lp, delstat)
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
    An array specifying the rows to be deleted.
  }
}

\details{
  Interface to the C function \code{delSetRows} which calls the CPLEX
  function \code{CPXdelsetrows}.
}

\value{
  Zero if successful, otherwise nonzero.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Claus Jonathan Fritzemeier <clausjonathan.fritzemeier@uni-duesseldorf.de>
}


\keyword{ optimize }

