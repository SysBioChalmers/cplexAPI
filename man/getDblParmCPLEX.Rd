\name{getDblParmCPLEX}
\alias{getDblParmCPLEX}
\alias{CPXgetdblparam}

\title{
  Obtain the Current Value of a CPLEX Parameter of Type Double
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetdblparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getDblParmCPLEX(env, parm)
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
  Interface to the C function \code{getDblParm} which calls the CPLEX
  function \code{CPXgetdblparam}.
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

\seealso{
  \code{\link{cplexConstants}}
}

\keyword{ optimize }

