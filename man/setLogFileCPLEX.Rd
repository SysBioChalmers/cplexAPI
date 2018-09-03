\name{setLogFileCPLEX}
\alias{setLogFileCPLEX}
\alias{CPXsetlogfile}

\title{
  Modifies the log file to which Messages are Written
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXsetlogfile}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  setLogFileCPLEX(env, cpfile = NULL)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{cpfile}{
    A pointer to a file as returned by \code{\link{openFileCPLEX}}.
  }
}

\details{
  Interface to the C function \code{getLogFile} which calls the CPLEX
  function \code{CPXgetlogfile}.
}

\value{
  Zero if successful, otherwise nonzero.
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
  \code{\link{getLogFileCPLEX}}
}

\keyword{ optimize }

