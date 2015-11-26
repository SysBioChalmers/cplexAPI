\name{addFpDestCPLEX}
\alias{addFpDestCPLEX}
\alias{CPXaddfpdest}

\title{
  Add a File to the List of Message Destinations for a Channel}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXaddfpdest}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  addFpDestCPLEX(env, newch, cpfile)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{newch}{
    Pointer to an IBM ILOG CPLEX channel as returned by
    \code{\link{addChannelCPLEX}}.
  }
  \item{cpfile}{
    Pointer to an IBM ILOG CPLEX file as returned by
    \code{\link{openFileCPLEX}}.
  }
}

\details{
  Interface to the C function \code{addFpDest} which calls the CPLEX
  function \code{CPXaddfpdest}.
}

\value{
  Zero if successful, otherwise nonzero.
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
  \code{\link{delFpDestCPLEX}}
}

\keyword{ optimize }

