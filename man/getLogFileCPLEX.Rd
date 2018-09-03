\name{getLogFileCPLEX}
\alias{getLogFileCPLEX}
\alias{CPXgetlogfile}

\title{
  Access log file to Which Messages are Written
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXgetlogfile}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  getLogFileCPLEX(env, ptrtype = "cplex_file")
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
  Interface to the C function \code{getLogFile} which calls the CPLEX
  function \code{CPXgetlogfile}.
}

\value{
  If successful, a pointer to the CPLEX file is returnd
  (an instance of class \code{"\linkS4class{cplexPtr}"}), otherwise an
  instance of class \code{"\linkS4class{cplexError}"}.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/support/knowledgecenter/SSSA5P}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\seealso{
  \code{\link{setLogFileCPLEX}}
}

\keyword{ optimize }

