\name{flushChannelCPLEX}
\alias{flushChannelCPLEX}
\alias{CPXflushchannel}

\title{
  Flush All Message Destinations Associated With a Channel
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXflushchannel}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  flushChannelCPLEX(env, newch)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{newch}{
    Pointer to a channel object as returned by \code{addChannelCPLEX}.
  }
}

\details{
  Interface to the C function \code{flushChannel} which calls the CPLEX
  function \code{CPXflushchannel}.
}

\value{
  \code{NULL}
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
  \code{\link{disconnectChannelCPLEX}}, \code{\link{flushStdChannelsCPLEX}},
  \code{\link{getChannelsCPLEX}}
}

\keyword{ optimize }

