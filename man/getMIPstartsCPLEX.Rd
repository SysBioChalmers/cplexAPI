\name{getMIPstartsCPLEX}
\alias{getMIPstartsCPLEX}
\alias{CPXgetmipstarts}

\title{
  Access a Range of MIP Starts of a CPLEX Problem Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetmipstarts}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getMIPstartsCPLEX(env, lp, begin, end)
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
	An integer specifying the beginning of the range of
	MIP starts to be returned.
  }
  \item{end}{
	An integer specifying the end of the range of
	MIP starts to be returned.
  }
}

\details{
  Interface to the C function \code{getMIPstarts} which calls the CPLEX
  function \code{CPXgetmipstarts}.
}

\value{
  If successful a list is returned:
  \item{beg         }{Array specifying where each of the requested MIP starts
                      begins in the arrays \code{varindices} and \code{values}.
                      Consult the IBM ILOG CPLEX documentation for more detailed
                      information.}
  \item{varindices  }{Array containing the numeric indices of the columns
                      corresponding to the variables which are assigned starting
                      values. Consult the IBM ILOG CPLEX documentation for more
                      detailed information.}
  \item{values      }{Array containing the values of the MIP starts. Consult the
                      IBM ILOG CPLEX documentation for more detailed
                      information.}
  \item{effortlevel }{Array containing the effort level for each MIP start
                      requested. Consult the IBM ILOG CPLEX documentation for
                      more detailed information.}
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


\keyword{ optimize }
