\name{closeFileCPLEX}
\alias{closeFileCPLEX}
\alias{CPXfclose}

\title{
  Close a File
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXfclose}. Consult the IBM ILOG CPLEX documentation for
  more detailed information. This funtion has no functionality
  from IBM ILOG CPLEX >= 12.9.0 on, where \code{CPXfclose} has
  been removed.
}

\usage{
  closeFileCPLEX(cpfile)
}

\arguments{
  \item{cpfile}{
    A pointer to a file as returned by \code{\link{openFileCPLEX}}.
  }
}

\details{
  Interface to the C function \code{cplexfclose} which calls the CPLEX
  function \code{CPXfclose}.
}

\value{
  Zero if successful, otherwise an instance of class \code{"\linkS4class{cplexError}"}.
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
  \code{\link{fileputCPLEX}}, \code{\link{openFileCPLEX}}
}

\keyword{ optimize }

