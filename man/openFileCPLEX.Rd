\name{openFileCPLEX}
\alias{openFileCPLEX}
\alias{CPXfopen}

\title{
  Open a File
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXfopen}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  openFileCPLEX(fname, ftype = "w", ptrtype = "cplex_file")
}

\arguments{
  \item{fname}{
    Character string giving the file name to be opened.
  }
  \item{ftype}{
    Character string according to the syntax of the standard C function
    \code{fopen}.
  }
  \item{ptrtype}{
    A name for the pointer object.
  }
}

\details{
  Interface to the C function \code{openFile} which calls the CPLEX
  function \code{CPXfopen}.
}

\value{
  A pointer to the log file (an instance of class
  \code{"\linkS4class{cplexPtr}"}) or \code{NULL}.
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
  \code{\link{closeFileCPLEX}}, \code{\link{fileputCPLEX}}
}

\keyword{ optimize }

