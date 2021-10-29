\name{setStrParmCPLEX}
\alias{setStrParmCPLEX}
\alias{CPXsetstrparam}

\title{
  Set the Value of a CPLEX String Parameter
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXsetstrparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  setStrParmCPLEX(env, parm, value)
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
  \item{value}{
    The new value of the parameter (character value).
  }
}

\details{
  Interface to the C function \code{setStrParm} which calls the CPLEX
  function \code{CPXsetstrparam}.
}

\value{
  Zero if successful, otherwise nonzero.
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
  \code{\link{cplexConstants}}
}

\keyword{ optimize }
