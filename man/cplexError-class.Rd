\name{cplexError-class}

\Rdversion{1.1}
\docType{class}

\alias{cplexError-class}
\alias{cplexError}
\alias{err,cplexError-method}
\alias{errmsg,cplexError-method}
\alias{errnum,cplexError-method}
\alias{errnum<-,cplexError-method}
\alias{err}
\alias{errmsg}
\alias{errnum}
\alias{errnum<-}

\title{Class \code{"cplexError"}}

\description{
  Objects of class \code{cpxerr} are returned by various functions of
  \pkg{cplexAPI}, in order to distinguish a status (error) code from a
  successfull result.
}

\section{Objects from the Class}{
  Objects can be created by calls of the form \code{cplexError(err)}, with
  \code{err} beeing an error code of IBM ILOG CPLEX.
}

\section{Slots}{
  \describe{
    \item{\code{errnum}:}{
      Object of class \code{"integer"} containing the error code.
    }
  }
}

\section{Methods}{
  \describe{
    \item{err}{\code{signature(object = "cplexError")}:
      Prints an error message string corresponding to the error code.
    }
    \item{errmsg}{\code{signature(object = "cplexError")}:
      Returns an error message string corresponding to the error code.
    }
    \item{errnum}{\code{signature(object = "cplexError")}:
      Gets the error code.
    }
    \item{errnum<-}{\code{signature(object = "cplexError")}:
      Sets the error code.
    }
  }
}

\references{
  The IBM ILOG CPLEX home page at
  \url{https://www.ibm.com/developerworks/university/academicinitiative/}.
}

\author{
  Gabriel Gelius-Dietrich

  Maintainer: Gabriel Gelius-Dietrich <geliudie@uni-duesseldorf.de>
}

\keyword{ optimize }

