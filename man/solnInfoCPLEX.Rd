\name{solnInfoCPLEX}
\alias{solnInfoCPLEX}
\alias{CPXsolninfo}

\title{
  Access Solution Information
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXsolninfo}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  solnInfoCPLEX(env, lp)
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
  Interface to the C function \code{solnInfo} which calls the CPLEX
  function \code{CPXsolninfo}.
}

\value{
  If successful a list is returned:
  \item{method }{Integer value specifying the method to produce the current
    solution.}
  \item{type }{Integer value specifying the type of current solution.}
  \item{primal_feasible }{Integer value specifying if the current solution
    is known to be primal feasible.}
  \item{dual_feasible }{Integer value specifying if the current solution
    is known to be dual feasible.}
  otherwise an instance of class \code{"\linkS4class{cplexError}"}.
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
  \code{\link{cplexConstants}}, \code{\link{solutionCPLEX}}
}

\keyword{ optimize }

