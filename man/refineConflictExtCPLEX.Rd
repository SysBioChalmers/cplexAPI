\name{refineConflictExtCPLEX}
\alias{refineConflictExtCPLEX}
\alias{CPXrefineconflictext}

\title{
  Identify a Minimal Conflict
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXrefineconflictext}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  refineConflictExtCPLEX(env, lp, grpcnt, concnt,
                         grppref, grpbeg, grpind, grptype)
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
  \item{grpcnt}{
    The number of constraint groups to be considered.
  }
  \item{concnt}{
    Length of arrays \code{grpind} and \code{grptype}.
  }
  \item{grppref}{
    Preferences for the groups.
  }
  \item{grpbeg}{
    The constraint indices. Consult the IBM ILOG CPLEX documentation
    for more detailed information.
  }
  \item{grpind}{
    The constraint indices. Consult the IBM ILOG CPLEX documentation
    for more detailed information.
  }
  \item{grptype}{
    The constraint indices. Consult the IBM ILOG CPLEX documentation
    for more detailed information.
  }
}

\details{
  Interface to the C function \code{refineConflictExt} which calls the CPLEX
  function \code{CPXrefineconflictext}.
}

\value{
  Zero if successful, otherwise nonzero.
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
