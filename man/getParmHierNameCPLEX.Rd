\name{getParmHierNameCPLEX}
\alias{getParmHierNameCPLEX}
\alias{CPXgetparamhiername}

\title{
  Obtain the hierarchy name string of a CPLEX parameter
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetparamhiername}. Consult the IBM ILOG CPLEX documentation for
  more detailed information. This funtion has no functionality
  for IBM ILOG CPLEX < 12.9.0 on, where \code{CPXgetparamhiername} was not included.
}

\usage{
  getParmHierNameCPLEX(env, whichparam)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{whichparam}{
    An integer specifying the symbolic constant (or reference number) of the desired parameter.
  }
}

\details{
  Interface to the C function \code{getParmHierName} which calls the CPLEX
  function \code{CPXgetparamhiername}.
}

\value{
  A single character value.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/support/knowledgecenter/SSSA5P}.
}

\author{
  Mayo Roettger <mayo.roettger@hhu.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\seealso{
  \code{\link{cplexConstants}}
}

\keyword{ optimize }

