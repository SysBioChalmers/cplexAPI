\name{delTerminateCPLEX}
\alias{delTerminateCPLEX}
\alias{CPXsetterminate}

\title{
  Terminate CPLEX gracefully
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXsetterminate}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  delTerminateCPLEX(env, tsig)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{tsig}{
    Pointer to termination signal as returned by
    \code{\link{setTerminateCPLEX}}.
  }
}

\details{
  Interface to the C function \code{setTerminate} which calls the CPLEX
  function \code{CPXsetterminate}.
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


\seealso{
  \code{\link{setTerminateCPLEX}}, \code{\link{printTerminateCPLEX}},
  \code{\link{chgTerminateCPLEX}}
}

\keyword{ optimize }

