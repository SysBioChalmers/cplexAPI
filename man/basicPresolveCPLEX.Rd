\name{basicPresolveCPLEX}
\alias{basicPresolveCPLEX}
\alias{CPXbasicpresolve}

\title{
  Perform Bound Strengthening and Detect Redundant Rows
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXbasicpresolve}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}
\usage{
  basicPresolveCPLEX(env, lp)
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
  Interface to the C function \code{basicPresolve} which calls the CPLEX
  function \code{CPXbasicpresolve}.
}

\value{
  If successfull, a list will be returned:
  \item{redlb}{strengthened lower bounds}
  \item{redub}{strengthened upper bounds}
  \item{rstat}{status of the row}
  Otherwise an object of class \code{"\linkS4class{cplexError}"}.
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

