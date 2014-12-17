\name{return_codeCPLEX}
\alias{return_codeCPLEX}

\title{
  Translates a IBM ILOG CPLEX Return Code into a Human Readable String
}

\description{
  Translates a IBM ILOG CPLEX return code into a human readable string.
}

\usage{
  return_codeCPLEX(code)
}

\arguments{
  \item{code}{
    Return (error) code from IBM ILOG CPLEX.
  }
}

\value{
  An error message string corresponding to an return (error) code.
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

