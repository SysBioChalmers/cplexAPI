\name{setIntParmCPLEX}
\alias{setIntParmCPLEX}
\alias{CPXsetintparam}

\title{
  Set the Value of a CPLEX Parameter of Type CPXINT
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXsetintparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  setIntParmCPLEX(env, parm, value)
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
    The new value of the parameter (integer value).
  }
}

\details{
  Interface to the C function \code{setIntParm} which calls the CPLEX
  function \code{CPXsetintparam}.
}

\value{
  Zero if successful, otherwise nonzero.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich

  Maintainer: Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>
}

\seealso{
  \code{\link{cplexConstants}}
}

\keyword{ optimize }
