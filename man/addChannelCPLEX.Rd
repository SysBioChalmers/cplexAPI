\name{addChannelCPLEX}
\alias{addChannelCPLEX}
\alias{CPXaddchannel}

\title{
  Instantiates a New Channel Object
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXaddchannel}.  Consult the IBM ILOG CPLEX documentation for more
  detailed information.
}

\usage{
  addChannelCPLEX(env, ptrtype = "cplex_chan")
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{ptrtype}{
    A name for the pointer object.
  }
}

\details{
  Interface to the C function \code{addChannel} which calls the CPLEX
  function \code{CPXaddchannel}.
}

\value{
  If successful, addChannelCPLEX returns a pointer to the new channel object
  (an instance of class \code{"\linkS4class{cplexPtr}"}); otherwise, it returns
  \code{NULL}.
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
  \code{\link{delChannelCPLEX}}, \code{\link{disconnectChannelCPLEX}},
  \code{\link{flushChannelCPLEX}}, \code{\link{flushStdChannelsCPLEX}},
  \code{\link{getChannelsCPLEX}}
}

\keyword{ optimize }

