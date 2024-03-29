\name{solutionCPLEX}
\alias{solutionCPLEX}
\alias{CPXsolution}

\title{
  Access Solution Values Produced by Optimization Routines
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXsolution}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  solutionCPLEX(env, lp)
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
  Interface to the C function \code{solution} which calls the CPLEX
  function \code{CPXsolution}.
}

\value{
  If successful a list is returned:
  \item{lpstat }{result of the optimization}
  \item{objval }{objective function value}
  \item{x }{values of the variables for the problem}
  \item{pi }{values of the dual variables}
  \item{slack }{values of the slack or surplus variables}
  \item{dj }{values of the reduced costs}
  otherwise an instance of class \code{"\linkS4class{cplexError}"}.
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
  \code{\link{cplexConstants}}, \code{\link{solnInfoCPLEX}}
}

\keyword{ optimize }

