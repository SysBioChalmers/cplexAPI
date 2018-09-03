\name{setDefaultParmCPLEX}
\alias{setDefaultParmCPLEX}
\alias{CPXsetdefaults}

\title{
  Reset All CPLEX Parameters And Settings to Default Values
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXsetdefaults}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}
\usage{
  setDefaultParmCPLEX(env)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
}

\details{
  Interface to the C function \code{setDefaultParm} which calls the CPLEX
  function \code{CPXsetdefaults}.
}

\value{
  Zero if successful, otherwise nonzero.
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
  \code{\link{cplexConstants}}
}

\keyword{ optimize }
