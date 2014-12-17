\name{status_codeCPLEX}
\alias{status_codeCPLEX}

\title{
  Translates an IBM ILOG CPLEX Status Value into a Human Readable String
}

\description{
  Translates a IBM ILOG CPLEX status code into a human readable string.
}

\usage{
  status_codeCPLEX(env, code)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{code}{
    Status code from IBM ILOG CPLEX as returned by \code{\link{getStatCPLEX}}.
  }
}

\value{
  A character string orresponding to the value of an IBM ILOG CPLEX status code
  as returned by \code{\link{getStatCPLEX}}.
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
  \code{\link{cplexConstants}}, \code{\link{getStatStrCPLEX}}
}

\keyword{ optimize }

