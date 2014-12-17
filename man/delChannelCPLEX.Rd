\name{delChannelCPLEX}
\alias{delChannelCPLEX}
\alias{CPXdelchannel}

\title{
  Flushes all Message Destinations for a Channel
}
\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXdelchannel}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}
\usage{
  delChannelCPLEX(env, newch)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{newch}{
    A pointer to the channel containing the message destinations as returned by
    \code{\link{CPXaddchannel}}.
  }
}

\details{
  Interface to the C function \code{delChannel} which calls the CPLEX
  function \code{CPXdelchannel}.
}

\value{
  \code{NULL}
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
  \code{\link{addChannelCPLEX}}, \code{\link{disconnectChannelCPLEX}},
  \code{\link{flushChannelCPLEX}}, \code{\link{flushStdChannelsCPLEX}},
  \code{\link{getChannelsCPLEX}}
}

\keyword{ optimize }

