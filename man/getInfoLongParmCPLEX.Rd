\name{getInfoLongParmCPLEX}
\alias{getInfoLongParmCPLEX}
\alias{CPXinfolongparam}

\title{
  Obtain Default, Minimum and Maximum Values of a Parameter of Type CPXLONG
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXinfolongparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getInfoLongParmCPLEX(env, parm)
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
  Interface to the C function \code{getInfoLongParm} which calls the CPLEX
  function \code{CPXinfolongparam}.
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
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Claus Jonathan Fritzemeier <clausjonathan.fritzemeier@uni-duesseldorf.de>
}


\note{
  In order to get a 64 bit integer value from \code{CPXinfolongparam},
  datatype \code{numeric} is used.  All return values will be numeric.
}

\seealso{
  \code{\link{getInfoIntParmCPLEX}}, \code{\link{cplexConstants}}
}

\keyword{ optimize }

