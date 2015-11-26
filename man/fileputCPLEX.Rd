\name{fileputCPLEX}
\alias{fileputCPLEX}
\alias{CPXfputs}

\title{
  Write to File
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXfputs}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  fileputCPLEX(cpfile, stuff = "")
}

\arguments{
  \item{cpfile}{
    A pointer to a file as returned by \code{\link{openFileCPLEX}}.
  }
  \item{stuff}{
    A character string to be written to the file.
  }
}

\details{
  Interface to the C function \code{fileput} which calls the CPLEX
  function \code{CPXfputs}.
}

\value{
  A nonnegative value if successful, otherwise \code{EOF}.
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
  \code{\link{closeFileCPLEX}}, \code{\link{openFileCPLEX}}
}

\keyword{ optimize }

