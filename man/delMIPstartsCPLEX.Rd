\name{delMIPstartsCPLEX}
\alias{delMIPstartsCPLEX}
\alias{CPXdelmipstarts}

\title{
  Delete a Range MIP Starts
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXdelmipstarts}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  delMIPstartsCPLEX(env, lp, begin, end)
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
  \item{begin}{
	An integer specifying the numeric index of the first MIP start to be
	deleted.
  }
  \item{end}{
	An integer specifying the numeric index of the last MIP start to be deleted.
  }
}

\details{
  Interface to the C function \code{delMIPstarts} which calls the CPLEX
  function \code{CPXdelmipstarts}.
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
