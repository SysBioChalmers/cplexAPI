\name{addMIPstartsCPLEX}
\alias{addMIPstartsCPLEX}
\alias{CPXaddmipstarts}

\title{
  Add Multiple MIP Starts to a CPLEX Problem Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXaddmipstarts}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  addMIPstartsCPLEX(env, lp, mcnt, nzcnt, beg, varindices,
                    values, effortlevel, mipstartname = NULL)
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
    Number of MIP starts to be added.
  }
  \item{nzcnt}{
    Number of variable values to be added.
  }
  \item{beg}{
    Array of length \code{mcnt} used with \code{varindices} and \code{values}.
    Consult the IBM ILOG CPLEX documentation for more detailed information.
  }
  \item{varindices}{
    Array of length \code{nzcnt} containing the numeric indices of the columns
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
  \item{mipstartname}{
    Names of the MIP starts.
  }
}

\details{
  Interface to the C function \code{addMIPstarts} which calls the CPLEX
  function \code{CPXaddmipstarts}.
}

\value{
  Zero if successful, otherwise nonzero.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/docs/en}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\keyword{ optimize }
