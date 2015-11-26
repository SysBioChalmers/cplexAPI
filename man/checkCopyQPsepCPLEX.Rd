\name{checkCopyQPsepCPLEX}
\alias{checkCopyQPsepCPLEX}
\alias{CPXcheckcopyqpsep}

\title{
  Validate Arguments of the Corresponding \code{copyQPsepCPLEX} Routine
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcheckcopyqpsep}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  checkCopyQPsepCPLEX(env, lp, qsepvec)
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
  \item{qsepvec}{
    A vector containing the quadratic coefficients.
  }
}

\details{
  Interface to the C function \code{checkCopyQPsep} which calls the CPLEX
  function \code{CPXcheckcopyqpsep}.
}

\value{
  Nonzero if it detects an error in the data; it returns zero if it does not
  detect any data errors.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Claus Jonathan Fritzemeier <clausjonathan.fritzemeier@uni-duesseldorf.de>
}


\seealso{
  \code{\link{copyQPsepCPLEX}}
}

\keyword{ optimize }
