\name{setLogFileNameCPLEX}
\alias{setLogFileNameCPLEX}
\alias{CPXsetlogfilename}

\title{
  Set and open a log file
}

\description{
  Low level interface function to the IBM ILOG CPLEX function
  \code{CPXsetlogfilename}. Consult the IBM ILOG CPLEX documentation for
  more detailed information. This function has no functionality
  for IBM ILOG CPLEX < 12.8.0, where \code{CPXsetlogfilename} was not included.
}

\usage{
  setLogFileNameCPLEX(env, filename = "cpx.log", mode = "w")
}

\arguments{
  \item{env}{
    An object of class \code{"\linkS4class{cplexPtr}"} as returned by
    \code{\link{openEnvCPLEX}}. This is basically a pointer to an
    IBM ILOG CPLEX environment.
  }
  \item{filename}{
    The name of the log file to open.
  }
  \item{mode}{
    The mode in which CPLEX should open the file. The specification is 
    the same as that for the C library function fopen. For example, use 
    a quoted character, such as "w" to write or "a" to append. Make sure 
    you open the file for writing; otherwise, CPLEX writes nothing to the 
    log file, and CPLEX can produce an error every time it attempts to 
    write. If filename is NULL, then this argument is ignored and can be 
    NULL, too. 
  }
}

\details{
  Interface to the C function \code{setLogFileName} which calls the CPLEX
  function \code{CPXsetlogfilename}.
}

\value{
  Zero if successful, otherwise nonzero.
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/docs/en}.
}

\author{
  Mayo Roettger <mayo.roettger@hhu.de>

  Maintainer: Mayo Roettger <mayo.roettger@hhu.de>
}


\seealso{
  \code{\link{cplexConstants}}
}

\keyword{ optimize }

