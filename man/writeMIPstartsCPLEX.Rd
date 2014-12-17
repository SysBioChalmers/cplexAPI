\name{writeMIPstartsCPLEX}
\alias{writeMIPstartsCPLEX}
\alias{CPXwritemipstarts}

\title{
  Write a Range of MIP Starts to a File in MST Format
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXwritemipstarts}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  writeMIPstartsCPLEX(env, lp, fname, begin, end)
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
  \item{fname}{
    Filename to write to.
  }
  \item{begin}{
	An integer specifying the beginning of the range of
	MIP starts to be written.
  }
  \item{end}{
	An integer specifying the end of the range of
	MIP starts to be written.
  }
}

\details{
  Interface to the C function \code{writeMIPstarts} which calls the CPLEX
  function \code{CPXwritemipstarts}.
}

\value{
  Zero if successful, otherwise nonzero.
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
