\name{setLongParmCPLEX}
\alias{setLongParmCPLEX}
\alias{CPXsetlongparam}

\title{
  Set the Value of a Parameter of Type CPXLONG
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXsetlongparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}
\usage{
  setLongParmCPLEX(env, parm, value)
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
    New value for the parameter.
  }
}

\details{
  Interface to the C function \code{setLongParm} which calls the CPLEX
  function \code{CPXsetlongparam}.
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

\note{
  In order to transfer a 64 bit integer value to \code{CPXsetlongparam},
  datatype \code{numeric} is used.  Parameter \code{value} is a numeric
  value.
}

\seealso{
  \code{\link{setIntParmCPLEX}}, \code{\link{cplexConstants}}
}

\keyword{ optimize }

