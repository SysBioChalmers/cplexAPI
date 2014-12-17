\name{delFpDestCPLEX}
\alias{delFpDestCPLEX}
\alias{CPXdelfpdest}

\title{
  Remove a File from the List of Message Destinations for a Channel
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXdelfpdest}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  delFpDestCPLEX(env, newch, cpfile)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{newch}{
    A pointer to the channel for which destinations are to be deleted as
    returned by \code{\link{CPXaddchannel}}.
  }
  \item{cpfile}{
    Pointer to an IBM ILOG CPLEX file as returned by
    \code{\link{openFileCPLEX}}.
  }
}

\details{
  Interface to the C function \code{delFpDest} which calls the CPLEX
  function \code{CPXdelfpdest}.
}

\value{
  Zero if successful, otherwise nonzero.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich

  Maintainer: Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>
}

\seealso{
  \code{\link{addFpDestCPLEX}}
}

\keyword{ optimize }

