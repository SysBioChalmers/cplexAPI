\name{getNumQPnzCPLEX}
\alias{getNumQPnzCPLEX}
\alias{CPXgetnumqpnz}

\title{
  Return the Number of Nonzeros in the Q Matrix
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetnumqpnz}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getNumQPnzCPLEX(env, lp)
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
  Interface to the C function \code{getNumQPnz} which calls the CPLEX
  function \code{CPXgetnumqpnz}.
}

\value{
  If successful the number of nonzeros in the Q matrix is returned.
  If \code{env} or \code{lp} do not exist, zero is returned.
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
