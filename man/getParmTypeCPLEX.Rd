\name{getParmTypeCPLEX}
\alias{getParmTypeCPLEX}
\alias{CPXgetparamtype}

\title{
  Obtain the Type of a CPLEX Parameter
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetparamtype}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getParmTypeCPLEX(env, parm)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{parm}{
    Constant or reference number of the desired parameter.
  }
}

\details{
  Interface to the C function \code{getParmType} which calls the CPLEX
  function \code{CPXgetparamtype}.
}

\value{
  A single integer value if successful, otherwise an instance of class
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


\seealso{
  \code{\link{cplexConstants}}
}

\keyword{ optimize }
