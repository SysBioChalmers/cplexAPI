\name{writeParmCPLEX}
\alias{writeParmCPLEX}
\alias{CPXwriteparam}

\title{
  Write Names and Current Settings of CPLEX Parameters to File
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXwriteparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  writeParmCPLEX(env, fname)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{fname}{
    Filename.
  }
}

\details{
  Interface to the C function \code{writeParm} which calls the CPLEX
  function \code{CPXwriteparam}.
}

\value{
  Zero if successful, otherwise nonzero.
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
