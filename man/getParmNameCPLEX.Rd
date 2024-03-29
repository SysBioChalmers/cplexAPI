\name{getParmNameCPLEX}
\alias{getParmNameCPLEX}
\alias{CPXgetparamname}

\title{
  Obtain the Name of a CPLEX Parameter, Given the Symbolic Constant
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetparamname}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getParmNameCPLEX(env, wparm)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{wparm}{
    Constant or reference number of the desired parameter.
  }
}

\details{
  Interface to the C function \code{getParmName} which calls the CPLEX
  function \code{CPXgetparamname}.
}

\value{
  A single character value.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/docs/en}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\seealso{
  \code{\link{cplexConstants}}
}

\keyword{ optimize }

