\name{getOrderCPLEX}
\alias{getOrderCPLEX}
\alias{CPXgetorder}

\title{
  Access MIP Priority Order Information
}
\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetorder}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getOrderCPLEX(env, lp)
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
  Interface to the C function \code{getOrder} which calls the CPLEX
  function \code{CPXgetorder}.
}

\value{
  If successful a list is returned:
  \item{indices }{indices of the variables in the order}
  \item{priority }{priority values}
  \item{direction }{preferred branching directions}
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

\seealso{
  \code{\link{cplexConstants}}
}

\keyword{ optimize }
