\name{setTerminateCPLEX}
\alias{setTerminateCPLEX}

\title{
  Release Termination Signal
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXsetterminate} with argument \code{terminate_p} set to \code{NULL}.
  Consult the IBM ILOG CPLEX documentation for more detailed information.
}
\usage{
  setTerminateCPLEX(env, ptrtype = "cplex_term")
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{ptrtype}{
    A name for the pointer object.
  }
}

\details{
  Interface to the C function \code{delTerminate} which calls the CPLEX
  function \code{CPXsetterminate} with argument \code{terminate_p} set to
  \code{NULL}.
}

\value{
  If successful, a pointer to a termination signal is returned, otherwise an
  instance of class \code{"\linkS4class{cplexError}"}.
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
  \code{\link{delTerminateCPLEX}}, \code{\link{printTerminateCPLEX}},
  \code{\link{chgTerminateCPLEX}}
}

\keyword{ optimize }

