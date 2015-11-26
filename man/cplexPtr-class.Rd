\name{cplexPtr-class}

\Rdversion{1.1}
\docType{class}

\alias{cplexPtr-class}
\alias{cplexPtr}
\alias{isCPLEXchanPointer,cplexPtr-method}
\alias{isCPLEXenvPointer,cplexPtr-method}
\alias{isCPLEXfilePointer,cplexPtr-method}
\alias{isCPLEXprobPointer,cplexPtr-method}
\alias{isCPLEXtermPointer,cplexPtr-method}
\alias{isNULLpointerCPLEX,cplexPtr-method}
\alias{cplexPointer,cplexPtr-method}
\alias{summary,cplexPtr-method}
\alias{cplexPtrType,cplexPtr-method}
\alias{cplexPtrType<-,cplexPtr-method}
\alias{isCPLEXchanPointer}
\alias{isCPLEXenvPointer}
\alias{isCPLEXfilePointer}
\alias{isCPLEXprobPointer}
\alias{isCPLEXtermPointer}
\alias{isNULLpointerCPLEX}
\alias{cplexPointer}
\alias{cplexPtrType}
\alias{cplexPtrType<-}

\title{Class \code{"cplexPtr"}}

\description{
  Structure of the class \code{"cplexPtr"}. Objects of that class are
  used to hold pointers to C structures used by IBM ILOG CPLEX.
}

\section{Objects from the Class}{
    Objects can be created by calls of the form\cr
    \code{env <- openEnvCPLEX()} and/or\cr
    \code{prob <- initProbCPLEX(env))}.
}

\section{Slots}{
  \describe{
    \item{\code{cplexPtrType}:}{
        Object of class \code{"character"} giving the pointer type.
    }
    \item{\code{cplexPointer}:}{
        Object of class \code{"externalptr"} containig the pointer to a
        C structure.
    }
  }
}

\section{Methods}{
  \describe{
    \item{isCPLEXchanPointer}{\code{signature(object = "cplexPtr")}:
        returns \code{TRUE} if \code{cplexPointer(object)} is a pointer to a
        CPLEX channel, otherwise \code{FALSE}.
    }
    \item{isCPLEXenvPointer}{\code{signature(object = "cplexPtr")}:
        returns \code{TRUE} if \code{cplexPointer(object)} is a pointer to a
        CPLEX environment, otherwise \code{FALSE}.
    }
    \item{isCPLEXfilePointer}{\code{signature(object = "cplexPtr")}:
        returns \code{TRUE} if \code{cplexPointer(object)} is a pointer to a
        CPLEX file, otherwise \code{FALSE}.
    }
    \item{isCPLEXprobPointer}{\code{signature(object = "cplexPtr")}:
        returns \code{TRUE} if \code{cplexPointer(object)} is a pointer to a
        CPLEX problem object, otherwise \code{FALSE}.
    }
    \item{isCPLEXtermPointer}{\code{signature(object = "cplexPtr")}:
        returns \code{TRUE} if \code{cplexPointer(object)} is a pointer to a
        CPLEX termination signal, otherwise \code{FALSE}.
    }
    \item{isNULLpointerCPLEX}{\code{signature(object = "cplexPtr")}:
        returns \code{TRUE} if \code{cplexPointer(object)} is a NULL pointer,
        otherwise \code{FALSE}.
    }
    \item{cplexPointer}{\code{signature(object = "cplexPtr")}:
        gets the \code{cplexPointer} slot.
    }
    \item{summary}{\code{signature(object = "cplexPtr")}:
        prints a summary of the problem object to the command line. If a
        solution is available, it prints also information retrieved by
        \code{\link{solutionCPLEX}} and \code{\link{solnInfoCPLEX}}. If no
        solution is available, it prints the corresponding error message.
        The method returns invisibly \code{NULL}. The CPLEX environment pointer
        is needed as second argument \code{env} to \code{summary}.
    }
    \item{cplexPtrType}{\code{signature(object = "cplexPtr")}:
        gets the \code{cplexPtrType} slot.
    }
    \item{cplexPtrType<-}{\code{signature(object = "cplexPtr")}:
        sets the \code{cplexPtrType} slot.
    }
  }
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
  \code{\link{openEnvCPLEX}} and \code{\link{initProbCPLEX}}
}

\keyword{ optimize }

