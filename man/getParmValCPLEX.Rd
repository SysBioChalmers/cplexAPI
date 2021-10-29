\name{getParmValCPLEX}
\alias{getParmValCPLEX}

\title{
  Values and Names of Parameters Having Non-Default Values
}

\description{
  The function \code{getParmValCPLEX} retrieves the names and actual values
  of all IBM ILOG CPLEX parameters, which do not have their default values.
}

\usage{
  getParmValCPLEX(env)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
}

\value{
  Either a list containing all non-default parameters and their values or
  \code{NULL}.
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
  \code{\link{cplexConstants}} and \code{\link{getChgParmCPLEX}}
}

\keyword{ optimize }

