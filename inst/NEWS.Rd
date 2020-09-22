%% cplexAPI Version History

\name{NEWS}
\title{cplexAPI News}
\encoding{UTF-8}
% ---------------------------------------------------------------------------- %
\section{Changes in version 1.4.1 2020-09-22}{
  \itemize{
    \item Adaptation of configure script to guess CPLEX installation directory on Mac OS, if neither environment variables 
    PKG_CPPFLAGS and PKG_LIBS, nor configure arguments --with-cplex-include and --with-cplex-lib are given, and option 
    --with-cplex-dir was not given and respective directory could not be extracted from the path variable.
    \item Small change in INSTALL file according to Mac OS installation information.
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.4.0 2020-09-17}{
  \itemize{
    \item Removed function \code{copyPartBaseCPLEX}, because corresponding CPLEX function \code{CPXcopypartialbase} was removed in CPLEX
    Version >= 12.10.0.
    \item Adaptation of configure script to extract correct linker options from example Makefile in CPLEX versions >= 10.9.0, 
    if neither environment variables PKG_CPPFLAGS and PKG_LIBS, nor configure arguments --with-cplex-include and --with-cplex-lib are given, 
    and option --with-cplex-dir was given or the respective directory could be extracted from the path variable.
    \item Adaptation of configure script to allow more flexibitlity in specifying the CPLEX installation directory with option --with-cplex-dir.
    \item Adaptation of Makevars.win to work with CPLEX version 12.10.0.
    \item According to a comment from Daniel Junglas, CPLEX functions \code{CPXinitialize} and \code{CPXfinalize} should be called when the 
    shared library is loaded and unloaded to prevent subtle bugs. \code{CPXinitialize} is now called within cplexAPI's \code{.onload()} hook. 
    CPXfinalize() is called via a finalizer of the namespace:cplexAPI environment.
    \item Small correction in INSTALL file to give the correct information for Windows installation.
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.3.6 2019-06-21}{
  \itemize{
    \item Added functions \code{setLogFileNameCPLEX} and \code{getLogFileName} for interfacing CPLEX functions \code{CPXsetlogfilename} and 
    \code{CPXgetlogfilename} if building package with CPLEX Version >= 12.8.0.
    \item Added funtion \code{getParmHierNameCPLEX} for interfacing CPLEX funtion \code{CPXgetparamhiername} if building with CPLEX Version 12.9.0.
    \item Interface Functions \code{openFileCPLEX}, \code{closeFileCPLEX}, \code{addFpDestCPLEX}, \code{delFpDestCPLEX}, \code{fileputCPLEX},
    \code{setLogFileCPLEX}, and \code{getLogFileCPLEX} will have no functionality and return NULL, if building with CPLEX version >= 12.9.0,
    because related CPLEX functions \code{CPXfopen}, \code{CPXfclose}, \code{CPXaddfpdest}, \code{CPXdelfpdest}, \code{CPXfputs}, \code{CPXsetlogfile}, 
    and \code{CPXgetlogfile} had been removed in CPLEX Version >= 12.9.0. For using logfiles, use \code{setLogFileNameCPLEX} and \code{getLogFileName}
    instead.
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.3.5 2018-09-03}{
  \itemize{
    \item maintainer change
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.3.4 2017-07-26}{
  \itemize{
    \item The function \code{solution} should avoid returning the dual solution if solved \code{FIXEDMILP}, \code{MILP}, \code{QCP}, \code{MIQCP}, \code{MIQP}, and \code{FIXEDMIQP}.
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.3.3 2017-01-18}{
  \itemize{
    \item In CPLEX Version 1270 are the functions \code{CPXaddchannel} and
    	\code{CPXdelchannel} removed (\url{http://www.ibm.com/support/knowledgecenter/SSSA5P_12.7.0/ilog.odms.cplex.help/CPLEX/ReleaseNotes/topics/releasenotes127/removed.html}).
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.3.2 2016-11-16}{
  \itemize{
    \item Fixed a bug in \code{getQuad()}. Thx to Florian Schwendinger.
    \item Added function \code{getNumQConstrsCPLEX} to access cplex function
    	\code{CPXgetnumqconstrs}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.11 2014-07-28}{
  \itemize{
    \item added support for new parameter names introduced in IBM ILOG CPLEX
          version 12.6
    \item fixed a bug in function \code{addQConstrCPLEX()}
    \item added functions \code{getQConstrCPLEX()}, \code{delQConstrsCPLEX()},
          \code{addIndConstrCPLEX()}, \code{getIndConstrCPLEX()} and
          \code{delIndConstrsCPLEX()}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.10 2013-09-28}{
  \itemize{
    \item added function \code{addQConstrCPLEX()}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.9 2013-05-23}{
  \itemize{
    \item added functions \code{copyOrderCPLEX()}, \code{getOrderCPLEX()},
          \code{readCopyOrderCPLEX} and \code{ordWriteCPLEX}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.8 2013-04-10}{
  \itemize{
    \item bugfix in function \code{getMIPrelGapCPLEX()}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.7 2013-04-08}{
  \itemize{
    \item added function \code{getMIPrelGapCPLEX()}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.6 2013-01-23}{
  \itemize{
    \item does not print the version number of IBM ILOG CPLEX on startup,
          because of problems with IBM ILOG CPLEX versions less than 12.5
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.5 2013-01-23}{
  \itemize{
    \item added support for IBM ILOG CPLEX version 12.5
    \item minor update in file \file{configure.ac} to be compatible with
          IBM ILOG CPLEX version 12.5
    \item minor change in file \file{src/Makevars.win}
    \item prints the version number of IBM ILOG CPLEX on startup
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.4 2012-12-19}{
  \itemize{
    \item added functions \code{copyQPsepCPLEX} and \code{checkCopyQPsepCPLEX}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.3 2012-10-01}{
  \itemize{
    \item added getMIPstartsCPLEX to \file{NAMESPACE}
    \item added function \code{getBestObjValCPLEX()}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.2 2012-04-20}{
  \itemize{
    \item renamed \code{cplexPtr} method \code{isNULLpointer} to
          \code{isNULLpointerCPLEX}

    \item renamed \code{cplexPtr} method \code{pType} to \code{cplexPtrType}

    \item renamed \code{cplexPtr} method \code{ptr} to \code{cplexPointer}

    \item renamed \code{cplexPtr} slot \code{pType} to \code{cplexPtrType}

    \item renamed \code{cplexPtr} slot \code{ptr} to \code{cplexPointer}

    \item updated \file{configure.ac} script, see \file{INSTALL} for updated
          installation instructions

    \item updated \file{configure.ac} script: all \code{printf} commands in
          \file{check.c} will be replaced trough \code{Rprintf} during configure 

    \item file \file{NEWS} is now in \file{inst/NEWS.Rd}

    \item function \file{getMIPstartsCPLEX()} is not exported, it is not
          working properly
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.1 2012-03-15}{
  \itemize{
    \item added functions \code{refineConflictExtCPLEX()},
                          \code{getConflictExtCPLEX()},
                          \code{refineMIPstartConflictCPLEX()},
                          \code{refineMIPstartConflictExtCPLEX()},
                          \code{getNumQPnzCPLEX()},
                          \code{getNumQuadCPLEX()},
                          \code{getQPcoefCPLEX()},
                          \code{getQuadCPLEX()} and
                          \code{chgQPcoefCPLEX()}.

    \item exported API-functions are registered

    \item added finalizers for pointers to IBM ILOG CPLEX environments

    \item Functions like \code{openEnvCPLEX()} and \code{initProbCPLEX()} return
          now instances of class \code{cplexPtr}. This class has two slots:
    \tabular{ll}{
      pType \tab a character string giving the pointer type and \cr
      ptr   \tab a pointer to a C structure                     \cr
    }

    \item updated package vignette

    \item C function \code{status_message()} now uses \code{REprintf} instead of
          \code{fprintf} to printing to \code{stderr}

    \item C function \code{printTerminate()} uses Rprintf instead of printf

    \item added methods \code{isNULLpointer}, \code{isCPLEXprobPointer}, 
          \code{isCPLEXenvPointer}, \code{isCPLEXfilePointer},
          \code{isCPLEXchanPointer} and \code{isCPLEXtermPointer} for objects
          of class \code{cplexPtr}

    \item method \code{show} for objects of class \code{cplexPtr}

    \item method \code{summary} for objects of class \code{cplexPtr}

    \item method \code{show} for objects of class \code{cplexError}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.2.0 2012-02-21}{
  \itemize{
    \item added functions \code{addMIPstartsCPLEX()},
                          \code{chgMIPstartsCPLEX()},
                          \code{getMIPstartsCPLEX()},
                          \code{getNumMIPstartsCPLEX()},
                          \code{delMIPstartsCPLEX()},
                          \code{writeMIPstartsCPLEX()},
                          \code{readCopyMIPstartsCPLEX()},
                          \code{getMIPstartNameCPLEX()} and
                          \code{getMIPstartIndexCPLEX()}.

    \item added support for IBM ILOG CPLEX version 12.4

    \item added \code{-Wl,-no_compact_unwind} to \file{configure.ac} for
          MacOS X amd64

    \item S3 class \code{cpxerr} is now S4 class \code{cplexError}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.9 2012-02-03}{
  \itemize{
    \item added functions \code{checkCopyQuadCPLEX()},
                          \code{copyQuadCPLEX()} and
                          \code{qpoptCPLEX()}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.8 2011-08-24}{
  \itemize{
    \item minor update in \file{configure.ac}
    \item updated documentation
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.7 2011-08-22}{
  \itemize{
    \item added compatibility to IBM ILOG CPLEX version 12.3: new functions
          \code{getInfoLongParmCPLEX()}, \code{getLongParmCPLEX()} and
          \code{setLongParmCPLEX()}

    \item removed argument \code{ncols} from \code{getLowBndsIdsCPLEX()} and
          \code{getUppBndsIdsCPLEX()}

    \item \code{getStatStrCPLEX()} needs argument \code{env}, it can not be
          \code{NULL}

    \item \code{getParmTypeCPLEX()} returns instance of class \code{cpxerr} when
          failed

    \item updated documentation
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.6 2011-08-17}{
  \itemize{
    \item avoid changing parameters by assignment
    \item some changes in S3 class \code{cpxerr}, new methods:
      \tabular{ll}{
        \code{as.cpxerr} \tab default constructor      \cr
        \code{errmsg}    \tab get error message        \cr
        \code{errnum}    \tab get error number         \cr
        \code{err}        \tab cat error message       \cr
        \code{'errnum<-'} \tab set/change error number \cr
      }
    \item updated documentation
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.5 2011-07-28}{
  \itemize{
    \item added \file{NAMESPACE}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.4 2011-07-27}{
  \itemize{
    \item removed file \file{COPYING}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.3 2011-07-27}{
  \itemize{
    \item updated package vignette
    \item added files \file{INSTALL} and \file{README}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.2 2011-07-26}{
  \itemize{
    \item updated \file{configure.ac} script
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.1 2011-07-12}{
  \itemize{
    \item renamed from sybilCPLEX to \pkg{cplexAPI}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.1.0 2011-05-17}{
  \itemize{
    \item updated documentation
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.0.1 2010-12-14}{
  \itemize{
    \item fixed a bug in \code{chgRhsCPLEX()}
  }
}


% ---------------------------------------------------------------------------- %
\section{Changes in version 1.0.0 2010-08-19}{
  \itemize{
    \item initial public release
  }
}



