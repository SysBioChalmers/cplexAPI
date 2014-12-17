\name{getLongParmCPLEX}
\alias{getLongParmCPLEX}
\alias{CPXgetlongparam}

\title{
  Obtain Current Value of a Parameter of Type CPXLONG
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetlongparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}
\usage{
  getLongParmCPLEX(env, parm)
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
  Interface to the C function \code{getLongParm} which calls the CPLEX
  function \code{CPXgetlongparam}.
}

\value{
  Parameter value if successful, otherwise an instance of class
  \code{"\linkS4class{cplexError}"}.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich

  Maintainer: Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>
}

\note{
  In order to get a 64 bit integer value from \code{CPXgetlongparam},
  datatype \code{numeric} is used.  The return value will be numeric.
}

\seealso{
  \code{\link{getIntParmCPLEX}}, \code{\link{cplexConstants}}
}

\keyword{ optimize }

