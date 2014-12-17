\name{getSiftPase1CntCPLEX}
\alias{getSiftPase1CntCPLEX}
\alias{CPXgetsiftphase1cnt}

\title{
	Access Number of Phase I Sifting Iterations
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetsiftphase1cnt}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getSiftPase1CntCPLEX(env, lp)
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
  Interface to the C function \code{getSiftPase1Cnt} which calls the CPLEX
  function \code{CPXgetsiftphase1cnt}.
}

\value{
  Zero if no solution exists, otherwise nonzero the Phase I iteration count.
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
