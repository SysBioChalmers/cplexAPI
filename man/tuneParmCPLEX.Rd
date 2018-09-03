\name{tuneParmCPLEX}
\alias{tuneParmCPLEX}
\alias{CPXtuneparam}

\title{
  Tune Parameters of the Environment For Improved Optimizer Performance
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXtuneparam}.  Consult the IBM ILOG CPLEX documentation for
  more detailed information.
}

\usage{
  tuneParmCPLEX(env, lp,
                nIntP = 0, intP = NULL, intPv = NULL,
                nDblP = 0, dblP = NULL, dblPv = NULL,
                nStrP = 0, strP = NULL, strPv = NULL)
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{lp}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{initProbCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX problem object.
  }
  \item{nIntP}{
    Number of integer parameters to be fixed during tuning.
  }
  \item{intP}{
    Parameter numbers of the integer parameters which remain fixed.
  }
  \item{intPv}{
    Values for the parameters listed in \code{intP}.
  }
  \item{nDblP}{
    Number of double parameters to be fixed during tuning.
  }
  \item{dblP}{
    Parameter numbers of the double parameters which remain fixed.
  }
  \item{dblPv}{
    Values for the parameters listed in \code{dblP}.
  }
  \item{nStrP}{
    Number of string parameters to be fixed during tuning.
  }
  \item{strP}{
    Parameter numbers of the string parameters which remain fixed.
  }
  \item{strPv}{
    Values for the parameters listed in \code{strP}.
  }
}

\details{
  Interface to the C function \code{tuneParam} which calls the CPLEX
  function \code{CPXtuneparam}.
}

\value{
  Zero if successful, otherwise an instance of class \code{"\linkS4class{cplexError}"}.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/support/knowledgecenter/SSSA5P}.
}

\author{
  Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\keyword{ optimize }

