\name{disconnectChannelCPLEX}
\alias{disconnectChannelCPLEX}
\alias{CPXdisconnectchannel}

\title{
  Flush all Message Destinations Associated with a Channel
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXdisconnectchannel}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  disconnectChannelCPLEX(env, newch)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{newch}{
    A pointer to the channel containing the message destinations as returned by
    \code{CPXaddchannel}.
  }
}

\details{
  Interface to the C function \code{disconnectChannel} which calls the CPLEX
  function \code{CPXdisconnectchannel}.
}

\value{
  \code{NULL}
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
  \code{\link{flushChannelCPLEX}}, \code{\link{flushStdChannelsCPLEX}},
  \code{\link{getChannelsCPLEX}}
}

\keyword{ optimize }

