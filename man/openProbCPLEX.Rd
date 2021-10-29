\name{openProbCPLEX}
\alias{openProbCPLEX}

\title{
  Create new CPLEX Environment And New CPLEX Problem Object
}

\description{
  The function \code{openProbCPLEX} creates a new CPLEX environment and a new
  CPLEX problem object.
}

\usage{
  openProbCPLEX(pname = "CPLEX_PROB",
                ptrtypeENV = "cplex_env",
                ptrtypePROB = "cplex_prob")
}

\arguments{
  \item{pname}{
    A single character string containing the name of the problem object.
  }
  \item{ptrtypeENV}{
    A name for the IBM ILOG CPLEX environment pointer object.
  }
  \item{ptrtypePROB}{
    A name for the IBM ILOG CPLEX problem pointer object.
  }
}

\details{
  Interface to the C functions \code{openEnv} and \code{initProb} calling CPLEX
  functions \code{CPXopenCPLEX} and \code{CPXcreateprob}.
}

\value{
  \item{env }{A pointer to the CPLEX environment as returned by
              \code{\link{openEnvCPLEX}}.}
  \item{lp  }{A pointer to the CPLEX problem object as returned by
              \code{\link{initProbCPLEX}}.}
  If \code{openEnvCPLEX()} failes, \code{env} will be of class
  \code{"\linkS4class{cplexError}"} and \code{lp} will be \code{NULL}. Each list element is
  an object of class \code{"\linkS4class{cplexPtr}"}.
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
  \code{\link{closeProbCPLEX}}, \code{\link{openEnvCPLEX}},
  \code{\link{initProbCPLEX}}
}

\keyword{ optimize }

