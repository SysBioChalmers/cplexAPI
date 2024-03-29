\name{initProbCPLEX}
\alias{initProbCPLEX}
\alias{CPXcreateprob}

\title{
  Create a CPLEX Problem Object in the CPLEX Environment
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcreateprob}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  initProbCPLEX(env, pname = "CPLEX_PROB", ptrtype = "cplex_prob")
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{pname}{
    A single character string containing the name of the problem object.
  }
  \item{ptrtype}{
    A name for the pointer object.
  }
}

\details{
  Interface to the C function \code{CPXcreate} which calls the CPLEX
  function \code{CPXcreateprob}.
}

\value{
  If successful, a pointer to the CPLEX problem object is returnd
  (an instance of class \code{"\linkS4class{cplexPtr}"}), otherwise an
  instance of class \code{"\linkS4class{cplexError}"}.
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
  \code{\link{delProbCPLEX}}
}

\keyword{ optimize }

