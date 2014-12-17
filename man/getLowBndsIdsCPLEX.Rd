\name{getLowBndsIdsCPLEX}
\alias{getLowBndsIdsCPLEX}

\title{
  Retrieve Lower Bounds on Variables
}

\description{
  The function retrieves the lower bounds on specified variables.
}

\usage{
  getLowBndsIdsCPLEX(env, lp, ind)
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
  A numeric vector containing the lower bounds on the specified variables.
  If not successfull an instance of class \code{"\linkS4class{cplexError}"} is
  returned.
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
  \code{\link{getLowerBndsCPLEX}}
}

\keyword{ optimize }


