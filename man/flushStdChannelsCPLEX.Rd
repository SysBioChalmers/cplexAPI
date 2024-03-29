\name{flushStdChannelsCPLEX}
\alias{flushStdChannelsCPLEX}
\alias{CPXflushstdchannels}

\title{
  Flushes the Output Buffers of the Four Standard Channels
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXflushstdchannels}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  flushStdChannelsCPLEX(env)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
}

\details{
  Interface to the C function \code{flushStdChannels} which calls the CPLEX
  function \code{CPXflushstdchannels}.
}

\value{
  Zero if successful, otherwise nonzero.
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
  \code{\link{disconnectChannelCPLEX}}, \code{\link{flushChannelCPLEX}},
  \code{\link{getChannelsCPLEX}}
}

\keyword{ optimize }

