AC_INIT([cplexAPI], [1.2.11], [geliudie@uni-duesseldorf.de])

## adopted from configure.ac in Rcplex_0.3-0

dnl # --------------------------------------------------------------------
dnl # global (environment) variables
dnl # --------------------------------------------------------------------
dnl
dnl # PKG_CPPFLAGS       C preprocessor flags -I...
dnl # PKG_CFLAGS         C compiler flags
dnl # PKG_LIBS           libraries -l...


dnl # --------------------------------------------------------------------
dnl # R compiler and flags
dnl # --------------------------------------------------------------------

: ${R_HOME=`R RHOME`}
if test -z "${R_HOME}"; then
    echo "could not determine R_HOME"
    exit 1
fi

dnl # GNU R default settings
CC=`"${R_HOME}/bin/R" CMD config CC`
CPP=`"${R_HOME}/bin/R" CMD config CPP`
CFLAGS=`"${R_HOME}/bin/R" CMD config CFLAGS`
CPPFLAGS=`"${R_HOME}/bin/R" CMD config CPPFLAGS`
AC_PROG_CC
AC_PROG_CPP


dnl # --------------------------------------------------------------------
dnl # template config.h.in
dnl # --------------------------------------------------------------------

AC_CONFIG_HEADERS([src/config.h])


dnl # --------------------------------------------------------------------
dnl # test for global variables
dnl # --------------------------------------------------------------------

ARGS_OK="FALSE"

if test [ -n "$PKG_CPPFLAGS" -a -n "$PKG_LIBS" ] ; then
    ARGS_OK="TRUE"
else
    if test [ -n "$PKG_CPPFLAGS" -o -n "$PKG_LIBS" ] ; then
        AC_MSG_ERROR([Please set both variables: PKG_CPPFLAGS AND PKG_LIBS])
    fi
fi


dnl # --------------------------------------------------------------------
dnl # get arguments
dnl # --------------------------------------------------------------------

AC_ARG_WITH(cplex-include,
            AC_HELP_STRING([--with-cplex-include=PATH],
                           [location of CPLEX include directory]
                          ),
            [CPLEX_INCLUDE=$withval],
            [CPLEX_INCLUDE=""])

AC_ARG_WITH(cplex-lib,
            AC_HELP_STRING([--with-cplex-lib=PATH],
                           [location of CPLEX callable library]
                          ),
            [CPLEX_LIB=$withval],
            [CPLEX_LIB=""])

AC_ARG_WITH(cplex-link,
	        AS_HELP_STRING([--with-cplex-link],
	                       [libraries to pass to the linker]
	                      ),
	        CPLEX_LINK=$withval,
	        CPLEX_LINK="")

AC_ARG_WITH(cplex-cflags,
	        AS_HELP_STRING([--with-cplex-cflags],
	                       [C flags for interface compilation]
	                      ),
	        CPLEX_CFLAGS=$withval,
	        CPLEX_CFLAGS="")

AC_ARG_WITH(cplex-dir,
	        AS_HELP_STRING([--with-cplex-dir],
	                       [CPLEX installation directory]
	                      ),
	        CPLEX_DIR=$withval,
	        CPLEX_DIR="")

dnl # CPLEX file check.c for debugging
AC_ARG_WITH(cplex-check,
            AC_HELP_STRING([--with-cplex-check=PATH],
                           [location of CPLEX file check.c]
                          ),
            [CPLEX_CHECK=$withval],
            [CPLEX_CHECK=""])


dnl # --------------------------------------------------------------------
dnl # test arguments
dnl # --------------------------------------------------------------------

dnl # include and library directories
if test [ "$ARGS_OK" = "FALSE" ] ; then

    if test [ -n "$CPLEX_INCLUDE" -a -n "$CPLEX_LIB" ] ; then
    
        if test [ -d "$CPLEX_INCLUDE" ] ; then
            PKG_CPPFLAGS="-I${CPLEX_INCLUDE}"
        else
            AC_MSG_ERROR([directory $CPLEX_INCLUDE does not exist])
        fi
    
        if test [ -d "$CPLEX_LIB" ] ; then
            PKG_LIBS="-L${CPLEX_LIB}"
        else
            AC_MSG_ERROR([directory $CPLEX_LIB does not exist])
        fi
        
        if test [ -n "$CPLEX_LINK" ] ; then
            PKG_LIBS="${PKG_LIBS} $CPLEX_LINK"
        else
            PKG_LIBS="${PKG_LIBS} -lcplex -lm -pthread"
        fi

        if test [ -n "$CPLEX_CFLAGS" ] ; then
            PKG_CFLAGS="$CPLEX_CFLAGS"
        fi

dnl # debugging routines
        if test [ -n "${CPLEX_CHECK}" -a -r "${CPLEX_CHECK}/check.c" ] ; then
            CPLEX_CHECK_PATH="${CPLEX_CHECK}"
            NO_CHECK="FALSE"
        else
            AC_MSG_WARN([cannot find file 'check.c'])
            NO_CHECK="TRUE"
        fi
        ARGS_OK="TRUE"
    else
        if test [ -n "$CPLEX_INCLUDE" -o -n "$CPLEX_LIB" ] ; then
            AC_MSG_ERROR([Please set both options: --with-cplex-include AND --with-cplex-lib])
        fi
    fi
fi


dnl # install directory (guess)
if test [ "$ARGS_OK" = "FALSE" -a -z "$CPLEX_DIR" ] ; then

    AC_PATH_PROG(CPLEX_BIN, cplex, "NONE")
    
    if test [ "$CPLEX_BIN" = "NONE" ] ; then
        AC_MSG_ERROR([CPLEX interactive optimizer not found])
    else
        CPLEX_DIR=`AS_DIRNAME(["$CPLEX_BIN"])`
        MACHINE=`expr //$CPLEX_DIR : '.*/\(.*\)'`
        CPLEX_DIR=`AS_DIRNAME(["$CPLEX_DIR"])`
        if test [ -z "$MACHINE" -o ! -d "${CPLEX_DIR}/${MACHINE}" ] ; then
            AC_MSG_ERROR([could not determine platform type])
        fi
        AC_MSG_NOTICE([platform type is $MACHINE])
        CPLEX_DIR=`AS_DIRNAME(["$CPLEX_DIR"])`
    fi
fi


dnl # install directory (--with-cplex-dir)
if test [ "$ARGS_OK" = "FALSE" ] ; then

dnl check for awk
    AC_PROG_AWK

    if test [ ! -d "$CPLEX_DIR/include" ] ; then
        AC_MSG_ERROR([CPLEX install directory not found: $CPLEX_DIR/include does not exist])
    fi

    if test [ -z "$MACHINE" ] ; then
        MACHINE=`ls -l ${CPLEX_DIR}/lib | ${AWK} '($1 ~ /^d/) { print $NF }' | head -n 1`
        if test [ -z "$MACHINE" -o ! -d "$CPLEX_DIR/lib/${MACHINE}" ] ; then
            AC_MSG_ERROR([could not determine platform type])
        fi
        AC_MSG_NOTICE([platform type is $MACHINE])
    fi

    LIBFORMAT=`ls -l ${CPLEX_DIR}/lib/${MACHINE} | ${AWK} '($1 ~ /^d/) { print $NF }' | head -n 1`
    if test [ -z "$LIBFORMAT" -o ! -d "${CPLEX_DIR}/lib/${MACHINE}/${LIBFORMAT}" ] ; then
        AC_MSG_ERROR([could not determine library type])
    fi
    AC_MSG_NOTICE([library type is $LIBFORMAT])

    CPLEX_MAKEFILE="${CPLEX_DIR}/examples/${MACHINE}/${LIBFORMAT}/Makefile"
    if test [! -f "$CPLEX_MAKEFILE" ] ; then
        AC_MSG_ERROR([could not find Makefile in $CPLEX_MAKEFILE])
    fi
    AC_MSG_NOTICE([path to example Makefile is $CPLEX_MAKEFILE])
    CPLEXLIBDIR="${CPLEX_DIR}/lib/${MACHINE}/${LIBFORMAT}"
    
    MAKEFILEVERSION=`${AWK} 'BEGIN {ORS = ""} /^CLNFLAGS/ { print $3 }' ${CPLEX_MAKEFILE}`
    ## AC_MSG_NOTICE([version $MAKEFILEVERSION])
    
    if test [ "${MAKEFILEVERSION}" = "-lcplex" ] ; then
        CPLEX_LIBS="-L${CPLEXLIBDIR} `${AWK} 'BEGIN {ORS = " "} /^CLNFLAGS/ { for (i=3;i<=NF;++i) print $i }' ${CPLEX_MAKEFILE}`"
    else
        CPLEX_LIBS="-L${CPLEXLIBDIR} `${AWK} 'BEGIN {ORS = " "} /^CLNFLAGS/ { for (i=4;i<=NF;++i) print $i }' ${CPLEX_MAKEFILE}`"
    fi
    if test [ -z CPLEX_LIBS ] ; then
        AC_MSG_ERROR([could not get linker options from CPLEX example Makefile])
    fi
    ## AC_MSG_NOTICE([CPLEX_LIBS is $CPLEX_LIBS])

    CPLEX_COPT=`${AWK} 'BEGIN {ORS = " "} /^COPT/ { for (i=3;i<=NF;++i) print $i }' ${CPLEX_MAKEFILE}`
    if test [ -z CPLEX_COPT ] ; then
        AC_MSG_ERROR([could not get compiler options from CPLEX example Makefile])
    fi

    CPLEX_CHECK_PATH="${CPLEX_DIR}/examples/src/c"
    if test [ -r "${CPLEX_CHECK_PATH}/check.c" ] ; then
        NO_CHECK="FALSE"
    else
        AC_MSG_WARN([cannot find file 'check.c'])
        NO_CHECK="TRUE"
    fi

    PKG_CFLAGS="$CPLEX_COPT"
    PKG_CPPFLAGS="-I$CPLEX_DIR/include"
    PKG_LIBS="$CPLEX_LIBS"
    ARGS_OK="TRUE"
fi


if test [ ! "$ARGS_OK" = "TRUE" ] ; then	
   AC_MSG_ERROR([no cplex installation found])
fi


dnl # debugging routines
if test [ -n "${CPLEX_CHECK_PATH}" -a "${NO_CHECK}" = "FALSE" ] ; then
    if test [ -e "${CPLEX_CHECK_PATH}/check.c" -a -r "${CPLEX_CHECK_PATH}/check.c" ] ; then
        cp ${CPLEX_CHECK_PATH}/check.c src/
        if test [ -r "src/check.c" ] ; then
            echo "#define printf Rprintf" | cat - src/check.c > src/tmp.c
            if test [ $? -ne 0 ] ; then
                AC_MSG_ERROR([modifying file 'check.c' failed])
            fi
            mv src/tmp.c src/check.c
            if test [ -e "tmp.c" ] ; then
                AC_MSG_ERROR([removing file 'tmp.c' failed])
            fi
            AC_DEFINE([USE_CHECK], [1], [defined, if check.c can be used])
            #AC_DEFINE([CPLEXX_NAMES], [1], [defined, if check.c can be used])
            PKG_CPPFLAGS="-DHAVE_CONFIG_H ${PKG_CPPFLAGS}"
        else
            AC_MSG_WARN([copying file check.c failed])
        fi
    else
        AC_MSG_WARN([can not read file check.c])
    fi
fi


dnl # --------------------------------------------------------------------
dnl # check header and library
dnl # --------------------------------------------------------------------

LIBS="${PKG_LIBS}"
CFLAGS="${CFLAGS} ${PKG_CFLAGS}"
CPPFLAGS="${CPPFLAGS} ${PKG_CPPFLAGS}"

AC_CHECK_HEADER([ilcplex/cplex.h], ,
    AC_MSG_ERROR([Could not find cplex.h:
      cplexAPI requires IBM ILOG CPLEX from http://www.ibm.com/.
      use --with-cplex-include or PKG_CPPFLAGS to specify the include path.]))


AC_SEARCH_LIBS([CPXopenCPLEX], [cplex], ,
    AC_MSG_ERROR([Could not link to IBM ILOG CPLEX:
      use --with-cplex-lib and --with-cplex-link or PKG_LIBS to specify the library path and the libraries to pass to the linker.]))


dnl # --------------------------------------------------------------------
dnl # substitute src/Makevars
dnl # --------------------------------------------------------------------

AC_SUBST(PKG_CFLAGS)
AC_SUBST(PKG_LIBS)
AC_SUBST(PKG_CPPFLAGS)
AC_OUTPUT(src/Makevars)

exit 0
