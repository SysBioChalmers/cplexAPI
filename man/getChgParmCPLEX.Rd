\name{getChgParmCPLEX}
\alias{getChgParmCPLEX}
\alias{CPXgetchgparam}

\title{
  Get Parameter Numbers for Parameters Which are Not Set at Their Default Values
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetchgparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}
\usage{
  getChgParmCPLEX(env)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
}

\details{
  Interface to the C function \code{getChgParm} which calls the CPLEX
  function \code{CPXgetchgparam}.
}

\value{
  A vector containing integer values (unique parameter identifiers) for
  parameters which are not set at their default values, otherwise an instance
  of class \code{"\linkS4class{cplexError}"}.
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
  \code{\link{cplexConstants}}
}

\keyword{ optimize }
