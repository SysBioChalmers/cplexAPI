\name{getIntQualCPLEX}
\alias{getIntQualCPLEX}
\alias{CPXgetintquality}

\title{
  Access Integer-Valued Information About the Quality of the Current Solution of
  a Problem
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetintquality}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getIntQualCPLEX(env, lp, w)
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
  \item{w}{
	An Integer specifying the quality value to be retrieved.
  }
}

\details{
  Interface to the C function \code{getIntQual} which calls the CPLEX
  function \code{CPXgetintquality}.
}

\value{
  Requested quality value if successful, otherwise an instance of class
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
