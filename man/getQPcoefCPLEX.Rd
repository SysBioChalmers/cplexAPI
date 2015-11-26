\name{getQPcoefCPLEX}
\alias{getQPcoefCPLEX}
\alias{CPXgetqpcoef}

\title{
  Access the Quadratic Coefficient in the Matrix Q
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetqpcoef}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getQPcoefCPLEX(env, lp, i, j)
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
  \item{i}{
    The row number in Q.
  }
  \item{j}{
    The row column in Q.
  }
}

\details{
  Interface to the C function \code{getQPcoef} which calls the CPLEX
  function \code{CPXgetqpcoef}.
}

\value{
  Specified quadratic coefficient in the matrix Q if successful, otherwise an
  instance of class \code{"\linkS4class{cplexError}"}.
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
