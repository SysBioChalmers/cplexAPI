\name{getObjValCPLEX}
\alias{getObjValCPLEX}
\alias{CPXgetobjval}

\title{
  Access Solution Objective Value
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetobjval}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getObjValCPLEX(env, lp)
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
  Interface to the C function \code{getObjVal} which calls the CPLEX
  function \code{CPXgetobjval}.
}

\value{
  Objective value if successful, otherwise an instance of class
  \code{"\linkS4class{cplexError}"}.
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
