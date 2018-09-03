\name{closeProbCPLEX}
\alias{closeProbCPLEX}

\title{
  Close CPLEX Environment And Remove CPLEX Problem Object
}
\description{
  The function \code{closeProbCPLEX} closes a CPLEX environment and removes a
  CPLEX problem object.
}
\usage{
  closeProbCPLEX(prob)
}

\arguments{
  \item{prob}{
    A list containing a pointer to an IBM ILOG CPLEX environment and a Pointer
    to an IBM ILOG CPLEX problem object. Both elements are objects of class
    \code{"\linkS4class{cplexPtr}"} as returned by \code{\link{openProbCPLEX}}.
  }
}

\details{
  Interface to the C functions \code{delProb} and \code{closeEnv} calling CPLEX
  functions \code{CPXcloseCPLEX} and \code{CPXfreeprob}.
}

\value{
  An integer vector containing the return values of \code{CPXcloseCPLEX} and
  \code{CPXfreeprob}.
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
  \code{\link{openProbCPLEX}}
}

\keyword{ optimize }

