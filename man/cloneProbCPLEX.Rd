\name{cloneProbCPLEX}
\alias{cloneProbCPLEX}
\alias{CPXcloneprob}

\title{
  Copy a CPLEX Problem Object
}
\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcloneprob}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}
\usage{
  cloneProbCPLEX(env, lp, ptrtype = "cplex_prob")
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
  \item{ptrtype}{
    A name for the pointer object.
  }
}

\details{
  Interface to the C function \code{cloneProb} which calls the CPLEX
  function \code{CPXcloneprob}.
}

\value{
  If successful a pointer to the new CPLEX problem object as returned by
  \code{\link{initProbCPLEX}} (an object of class
  \code{"\linkS4class{cplexPtr}"}), otherwise an instance of class
  \code{"\linkS4class{cplexError}"}.
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

