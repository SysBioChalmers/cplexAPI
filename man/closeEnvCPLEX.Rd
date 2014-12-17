\name{closeEnvCPLEX}
\alias{closeEnvCPLEX}
\alias{CPXcloseCPLEX}

\title{
  Free all of the Data Structures Associated With CPLEX
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcloseCPLEX}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  closeEnvCPLEX(env)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
}

\details{
  Interface to the C function \code{closeEnv} which calls the CPLEX
  function \code{CPXcloseCPLEX}.
}

\value{
  Zero if successful, otherwise an instance of class \code{"\linkS4class{cplexError}"}.
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
  \code{\link{openEnvCPLEX}}
}

\keyword{ optimize }

