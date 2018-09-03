\name{printTerminateCPLEX}
\alias{printTerminateCPLEX}

\title{
  Print Termination Signal
}

\description{
  The function \code{chgTerminateCPLEX} prints termination signal.
}

\usage{
  printTerminateCPLEX(env)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
}

\value{
  \code{NULL}
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
  \code{\link{setTerminateCPLEX}}, \code{\link{delTerminateCPLEX}},
  \code{\link{chgTerminateCPLEX}}
}

\keyword{ optimize }

