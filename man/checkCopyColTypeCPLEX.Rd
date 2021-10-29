\name{checkCopyColTypeCPLEX}
\alias{checkCopyColTypeCPLEX}
\alias{CPXcheckcopyctype}

\title{
  Validate Arguments of the Corresponding \code{copyColTypeCPLEX} Routine
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXcheckcopyctype}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  checkCopyColTypeCPLEX(env, lp, xctype)
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
  \item{xctype}{
	A vector containing the type of each column in the constraint matrix.
  }
}

\details{
  Interface to the C function \code{checkCopyColType} which calls the CPLEX
  function \code{CPXcheckcopyctype}.
}

\value{
  Nonzero if it detects an error in the data; it returns zero if it does not
  detect any data errors.
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
  \code{\link{copyColTypeCPLEX}}
}

\keyword{ optimize }
