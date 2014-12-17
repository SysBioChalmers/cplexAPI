\name{getColTypeCPLEX}
\alias{getColTypeCPLEX}
\alias{CPXgetctype}

\title{
  Access Types for a Range of Variables
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetctype}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getColTypeCPLEX(env, lp, begin, end)
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
	An integer specifying the beginning of the range of the types to be
	returned.
  }
  \item{end}{
	An integer specifying the end of the range of the types to be returned.
  }
}

\details{
  Interface to the C function \code{getColType} which calls the CPLEX
  function \code{CPXgetctype}.
}

\value{
  Column types if successful, otherwise an instance of class
  \code{"\linkS4class{cplexError}"}.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich

  Maintainer: Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>
}

\seealso{
  \code{\link{cplexConstants}}
}

\keyword{ optimize }
