\name{getDblQualCPLEX}
\alias{getDblQualCPLEX}
\alias{CPXgetdblquality}

\title{
  Access Double-Valued Information About the Quality of the Current Solution of
  a Problem
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetdblquality}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  getDblQualCPLEX(env, lp, w)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{lp}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{initProbCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX problem object.
  }
  \item{w}{
	An Integer specifying the quality value to be retrieved.
  }
}

\details{
  Interface to the C function \code{getDblQual} which calls the CPLEX
  function \code{CPXgetdblquality}.
}

\value{
  Requested quality value if successful, otherwise an instance of class
  \code{"\linkS4class{cplexError}"}.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Claus Jonathan Fritzemeier <clausjonathan.fritzemeier@uni-duesseldorf.de>
}


\seealso{
  \code{\link{cplexConstants}}
}

\keyword{ optimize }
