\name{getInfoStrParmCPLEX}
\alias{getInfoStrParmCPLEX}
\alias{CPXinfostrparam}

\title{
  Obtain Default Value of a String Parameter
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXinfostrparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getInfoStrParmCPLEX(env, parm)
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
  Interface to the C function \code{getInfoStrParm} which calls the CPLEX
  function \code{CPXinfostrparam}.
}

\value{
  A single character value.
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
  \code{\link{cplexConstants}}
}

\keyword{ optimize }

