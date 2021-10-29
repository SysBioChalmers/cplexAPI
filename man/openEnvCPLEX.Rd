\name{openEnvCPLEX}
\alias{openEnvCPLEX}
\alias{CPXopenCPLEX}

\title{
  Initialize a CPLEX Environment
}
\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXopenCPLEX}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}
\usage{
  openEnvCPLEX(ptrtype = "cplex_env")
}

\arguments{
  \item{ptrtype}{
    A name for the pointer object.
  }
}

\details{
  Interface to the C function \code{openEnv} which calls the CPLEX
  function \code{CPXopenCPLEX}.
}

\value{
  If successful, a pointer to the CPLEX environment is returnd
  (an instance of class \code{"\linkS4class{cplexPtr}"}), otherwise an
  instance of class \code{"\linkS4class{cplexError}"}.
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
  \code{\link{closeEnvCPLEX}}
}

\keyword{ optimize }

