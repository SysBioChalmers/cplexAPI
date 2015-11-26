\name{chgMIPstartsCPLEX}
\alias{chgMIPstartsCPLEX}
\alias{CPXchgmipstarts}

\title{
  Modify or Extend Multiple MIP Starts
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXchgmipstarts}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  chgMIPstartsCPLEX(env, lp, mcnt, mipstartindices, nzcnt,
                    beg, varindices, values, effortlevel)
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
  \item{mcnt}{
    Number of MIP starts to be changed.
  }
  \item{mipstartindices}{
    Array of length \code{mcnt} containing the numeric indices of the MIP
    starts to be changed.
  }
  \item{nzcnt}{
    Number of entries to be changed.
  }
  \item{beg}{
    Array of length \code{mcnt} used with \code{varindices} and \code{values}.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
  \item{varindices}{
    Aarray of length \code{nzcnt} containing the numeric indices of the columns
    corresponding to the variables which are assigned starting values.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
  \item{values}{
    Array of length \code{nzcnt} containing the values to use for the MIP
    starts.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
  \item{effortlevel}{
    Array of length \code{mcnt}.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
}

\details{
  Interface to the C function \code{chgMIPstarts} which calls the CPLEX
  function \code{CPXchgmipstarts}.
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
