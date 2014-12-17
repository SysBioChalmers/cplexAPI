\name{rhsSaCPLEX}
\alias{rhsSaCPLEX}
\alias{CPXrhssa}

\title{
  Access Upper and Lower Sensitivity Ranges for Righthand Side Values of a
  Range of Constraints
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXrhssa}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  rhsSaCPLEX(env, lp, begin, end)
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
    Beginning of the range of ranges to be returned.
  }
  \item{end}{
    End of the range of ranges to be returned.
  }
}

\details{
  Interface to the C function \code{rhsSa} which calls the CPLEX
  function \code{CPXrhssa}.
}

\value{
  If successful a list is returned:
  \item{lower }{righthand side lower range values}
  \item{upper }{righthand side upper range values}
  otherwise an instance of class \code{"\linkS4class{cplexError}"}.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich

  Maintainer: Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>
}

\keyword{ optimize }

