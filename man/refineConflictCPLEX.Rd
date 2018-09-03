\name{refineConflictCPLEX}
\alias{refineConflictCPLEX}
\alias{CPXrefineconflict}

\title{
  Identify a Minimal Conflict for the Infeasibility of the Linear Constraints
  and the Variable Bounds
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXrefineconflict}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}
\usage{
  refineConflictCPLEX(env, lp)
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
  Interface to the C function \code{refineConflict} which calls the CPLEX
  function \code{CPXrefineconflict}.
}

\value{
  If successful a list is returned:
  \item{confnumrows }{number of linear constraints in the conflict}
  \item{confnumcols }{number of variable bounds in the conflict}
  otherwise an instance of class \code{"\linkS4class{cplexError}"}.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/support/knowledgecenter/SSSA5P}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\seealso{
  \code{\link{getConflictCPLEX}}
}

\keyword{ optimize }

