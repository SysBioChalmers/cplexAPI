\name{getInfoIntParmCPLEX}
\alias{getInfoIntParmCPLEX}
\alias{CPXinfointparam}

\title{
  Obtain Default, Minimum and Maximum Values of a Parameter of Type CPXINT
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXinfointparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getInfoIntParmCPLEX(env, parm)
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
  Interface to the C function \code{getInfoIntParm} which calls the CPLEX
  function \code{CPXinfointparam}.
}

\value{
  If successful a list is returned:
  \item{defvalue }{default value}
  \item{minvalue }{minimum value}
  \item{maxvalue }{maximum value}
  otherwise an instance of class \code{"\linkS4class{cplexError}"}.
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

