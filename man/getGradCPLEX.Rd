\name{getGradCPLEX}
\alias{getGradCPLEX}
\alias{CPXgetgrad}

\title{
  Project the Impact of Making Changes to Optimal Variable Values or Objective
  Function Coefficients
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetgrad}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getGradCPLEX(env, lp, j)
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
  \item{j}{
	An integer specifying the index of the column of interest.
  }
}

\details{
  Interface to the C function \code{getGrad} which calls the CPLEX
  function \code{CPXgetgrad}.
}

\value{
  If successful a list is returned:
  \item{head }{listing of the indices of the basic variables in the order in
               which they appear in the basis.}
  \item{y }{coefficients of the \code{j}-th column relative to the current
            basis.}
  otherwise an instance of class \code{"\linkS4class{cplexError}"}.
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
