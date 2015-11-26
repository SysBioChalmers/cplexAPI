\name{closeFileCPLEX}
\alias{closeFileCPLEX}
\alias{CPXfclose}

\title{
  Close a File
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXfclose}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
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
  Interface to the C function \code{closeFile} which calls the CPLEX
  function \code{CPXfclose}.
}

\value{
  Zero if successful, otherwise an instance of class \code{"\linkS4class{cplexError}"}.
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
  \code{\link{fileputCPLEX}}, \code{\link{openFileCPLEX}}
}

\keyword{ optimize }

