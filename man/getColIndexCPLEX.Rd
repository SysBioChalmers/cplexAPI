\name{getColIndexCPLEX}
\alias{getColIndexCPLEX}
\alias{CPXgetcolindex}

\title{
  Search for the Index Number of the Specified Column
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetcolindex}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getColIndexCPLEX(env, lp, cname)
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
  \item{cname}{
	A column name to search for.
  }
}

\details{
  Interface to the C function \code{getColIndex} which calls the CPLEX
  function \code{CPXgetcolindex}.
}

\value{
  Column number if successful, otherwise an instance of class
  \code{"\linkS4class{cplexError}"}.
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
