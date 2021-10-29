\name{preslvWriteCPLEX}
\alias{preslvWriteCPLEX}
\alias{CPXpreslvwrite}

\title{
  Write a Presolved Version of the Problem to File
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXpreslvwrite}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  preslvWriteCPLEX(env, lp, fname)
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
    Single character value giving the file name to write to.
  }
}

\details{
  Interface to the C function \code{preslvWrite} which calls the CPLEX
  function \code{CPXpreslvwrite}.
}

\value{
  If successful a dingle numeric value containing the objective value difference
  between the original problem and the presolved problem, otherwise an instance
  of class \code{"\linkS4class{cplexError}"}.
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
  \code{\link{readCopyProbCPLEX}}
}

\keyword{ optimize }

