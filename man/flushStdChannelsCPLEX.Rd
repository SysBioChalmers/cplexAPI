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
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich

  Maintainer: Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>
}

\seealso{
  \code{\link{addChannelCPLEX}}, \code{\link{delChannelCPLEX}},
  \code{\link{disconnectChannelCPLEX}}, \code{\link{flushChannelCPLEX}},
  \code{\link{getChannelsCPLEX}}
}

\keyword{ optimize }

