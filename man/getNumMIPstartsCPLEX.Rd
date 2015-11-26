\name{getNumMIPstartsCPLEX}
\alias{getNumMIPstartsCPLEX}
\alias{CPXgetnummipstarts}

\title{
  Access the Number of MIP Starts in the CPLEX Problem Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetnummipstarts}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getNumMIPstartsCPLEX(env, lp)
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
  Interface to the C function \code{getNumMIPstarts} which calls the CPLEX
  function \code{CPXgetnummipstarts}.
}

\value{
  If successful the number of MIP starts is returned. If \code{env} or \code{lp}
  do not exist, zero is returned.
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
