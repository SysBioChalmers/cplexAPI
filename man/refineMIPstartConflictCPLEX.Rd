\name{refineMIPstartConflictCPLEX}
\alias{refineMIPstartConflictCPLEX}
\alias{CPXrefinemipstartconflict}

\title{
  Refine a Conflict in Order to Determine Why a Given MIP Start is Not Feasible
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXrefinemipstartconflict}.  Consult the IBM ILOG CPLEX documentation
  for more detailed information. This function has no functionality
  from IBM ILOG CPLEX >= 20.1.0 on, where \code{CPXrefinemipstartconflict} has
  been deprecated or removed. See \code{refineMipStartConflictCPLEX}.
}

\usage{
  refineMIPstartConflictCPLEX(env, lp, mipstartindex)
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
  \item{mipstartindex}{
    The index of the MIP start.
  }
}

\details{
  Interface to the C function \code{refineMIPstartConflict} which calls the
  CPLEX function \code{CPXrefinemipstartconflict}.
}

\value{
  If successful a list is returned:
  \item{confnumrows }{number of linear constraints in the conflict}
  \item{confnumcols }{number of variable bounds in the conflict}
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
  \code{\link{getConflictCPLEX}}
}

\keyword{ optimize }

