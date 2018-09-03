\name{getUppBndsIdsCPLEX}
\alias{getUppBndsIdsCPLEX}

\title{
  Retrieve Upper Bounds on Variables
}

\description{
  The function retrieves the upper bounds on specified variables.
}

\usage{
  getUppBndsIdsCPLEX(env, lp, ind)
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
  \item{ind}{
    Column indices of variables (remember: first index is \code{0}).
  }
}

\value{
  A numeric vector containing the upper bounds on the specified variables.
  If not successfull an instance of class \code{"\linkS4class{cplexError}"} is
  returned.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/support/knowledgecenter/SSSA5P}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\seealso{
  \code{\link{getUpperBndsCPLEX}}
}

\keyword{ optimize }

