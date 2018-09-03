\name{setDblParmCPLEX}
\alias{setDblParmCPLEX}
\alias{CPXsetdblparam}

\title{
  Set the Value of a CPLEX Parameter of Type Double
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXsetdblparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  setDblParmCPLEX(env, parm, value)
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
    The new value of the parameter.
  }
}

\details{
  Interface to the C function \code{setDblParm} which calls the CPLEX
  function \code{CPXsetdblparam}.
}

\value{
  Zero if successful, otherwise nonzero.
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
