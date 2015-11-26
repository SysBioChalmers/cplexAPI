\name{getLowerBndsCPLEX}
\alias{getLowerBndsCPLEX}
\alias{CPXgetlb}

\title{
  Access a Range of Lower Bounds on Variables
}
\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetlb}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}
\usage{
  getLowerBndsCPLEX(env, lp, begin, end)
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
    Beginning of the range of lower bounds to be returned.
  }
  \item{end}{
    End of the range of lower bounds to be returned.
  }
}

\details{
  Interface to the C function \code{getLowerBnds} which calls the CPLEX
  function \code{CPXgetlb}.
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
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Claus Jonathan Fritzemeier <clausjonathan.fritzemeier@uni-duesseldorf.de>
}


\keyword{ optimize }

