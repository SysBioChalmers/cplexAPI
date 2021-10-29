\name{getCutoffCPLEX}
\alias{getCutoffCPLEX}
\alias{CPXgetcutoff}

\title{
  Access MIP Cutoff Value Being Used During Mixed Integer Optimization.
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetcutoff}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getCutoffCPLEX(env, lp)
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
  Interface to the C function \code{getCutoff} which calls the CPLEX
  function \code{CPXgetcutoff}.
}

\value{
  Value of the cutoff if successful, otherwise an instance of class
  \code{"\linkS4class{cplexError}"}.
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
