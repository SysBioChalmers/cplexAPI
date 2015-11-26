\name{getMethodCPLEX}
\alias{getMethodCPLEX}
\alias{CPXgetmethod}

\title{
  Obtain Solution Algorithm
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetmethod}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getMethodCPLEX(env, lp)
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
}

\details{
  Interface to the C function \code{getMethod} which calls the CPLEX
  function \code{CPXgetmethod}.
}

\value{
  A single integer value specifying the solution algorithm.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Claus Jonathan Fritzemeier <clausjonathan.fritzemeier@uni-duesseldorf.de>
}


\seealso{
  \code{\link{cplexConstants}} section \dQuote{LP/QP solution algorithms}.
}

\keyword{ optimize }

