\name{getMIPrelGapCPLEX}
\alias{getMIPrelGapCPLEX}
\alias{CPXgetmiprelgap}

\title{
  Access Relative Objective Gap for a MIP Optimization
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetmiprelgap}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getMIPrelGapCPLEX(env, lp)
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
  Interface to the C function \code{getMIPrelGap} which calls the CPLEX
  function \code{CPXgetmiprelgap}.
}

\value{
  Relative Objective Gap if successful, otherwise an instance of class
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

\seealso{
   \code{\link{getObjValCPLEX}}, \code{\link{getBestObjValCPLEX}}
}

\keyword{ optimize }
