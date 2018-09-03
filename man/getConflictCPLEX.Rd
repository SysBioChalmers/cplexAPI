\name{getConflictCPLEX}
\alias{getConflictCPLEX}
\alias{CPXgetconflict}

\title{
  Return Linear Constraints and Variables Belonging to a Conflict
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetconflict}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getConflictCPLEX(env, lp)
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
  Interface to the C function \code{getConflict} which calls the CPLEX
  function \code{CPXgetconflict}.
}

\value{
  If successful a list is returned:
  \item{confstat }{status of the conflict}
  \item{confnumrows }{number of rows in the conflict}
  \item{rowind }{indices of the constraints that participate in the conflict}
  \item{rowbdstat }{conflict status of the rows}
  \item{confnumcols }{number of columns in the conflict}
  \item{colind }{indices of the variables that participate in the conflict}
  \item{colbdstat }{conflict status of the columns}
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
  \code{\link{cplexConstants}}
}

\keyword{ optimize }
