/* cplexR.h
   R Interface to C API of IBM ILOG CPLEX Version 12.1 to 12.10.

   Copyright (C) 2011-2014 Gabriel Gelius-Dietrich, Dpt. for Bioinformatics,
   Institute for Informatics, Heinrich-Heine-University, Duesseldorf, Germany.
   All right reserved.
   Email: geliudie@uni-duesseldorf.de

   This file is part of cplexAPI.

   CplexAPI is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   CplexAPI is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with cplexAPI.  If not, see <http://www.gnu.org/licenses/>.
*/


#include <stdlib.h>


/* avoid remapping of Rf_<function> to <function> in R header files */
#ifndef R_NO_REMAP
#define R_NO_REMAP
#endif /* R_NO_REMAP */

/* use strict R headers */
#ifndef STRICT_R_HEADERS
#define STRICT_R_HEADERS
#endif /* STRICT_R_HEADERS */

#include <R.h>
#include <Rinternals.h>


/* http://www.stats.ox.ac.uk/~ripley/Win64/W64porting.html */

#if defined(WIN64) && !defined(_MSC_VER)
#define CHECK_FOR_WIN64
#define _MSC_VER
#endif

#include <ilcplex/cplex.h>

#ifdef CHECK_FOR_WIN64
#undef _MSC_VER
#endif

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif /* HAVE_CONFIG_H */


#if defined(CPX_VERSION) && (CPX_VERSION >= 12030000)
#   define CPLEXAPIMSGBUFF CPXMESSAGEBUFSIZE
#else
#   define CPLEXAPIMSGBUFF 4096
#endif


/* -------------------------------------------------------------------------- */
/* NULL */
#define checkIfNil(cp) do { \
    if (R_ExternalPtrAddr(cp) == NULL) \
        Rf_error("You passed a nil value!"); \
} while (0)


/* -------------------------------------------------------------------------- */
/* problem */
#define checkTypeOfProb(cp) do { \
    if ( (TYPEOF(cp) != EXTPTRSXP) || (R_ExternalPtrTag(cp) != tagCPLEXprob) ) \
        Rf_error("You must pass a pointer to an ILOG CPLEX problem!"); \
} while (0)

#define checkProb(p) do { \
    checkIfNil(p); \
    checkTypeOfProb(p); \
} while (0)


/* -------------------------------------------------------------------------- */
/* environment */
#define checkTypeOfEnv(ce) do { \
    if ( (TYPEOF(ce) != EXTPTRSXP) || (R_ExternalPtrTag(ce) != tagCPLEXenv) ) \
        Rf_error("You must pass a pointer to an ILOG CPLEX environment!"); \
} while (0)

#define checkEnv(e) do { \
    checkIfNil(e); \
    checkTypeOfEnv(e); \
} while (0)


/* -------------------------------------------------------------------------- */
/* file */
#define checkTypeOfFile(fl) do { \
    if ( (TYPEOF(fl) != EXTPTRSXP) || (R_ExternalPtrTag(fl) != tagCPLEXfile) ) \
        Rf_error("You must pass a pointer to an ILOG CPLEX file!"); \
} while (0)

#define checkFile(f) do { \
    checkIfNil(f); \
    checkTypeOfFile(f); \
} while (0)


/* -------------------------------------------------------------------------- */
/* channel */
#define checkTypeOfChannel(ch) do { \
    if ( (TYPEOF(ch) != EXTPTRSXP) || \
         (R_ExternalPtrTag(ch) != tagCPLEXchannel) ) \
        Rf_error("You must pass a pointer to an ILOG CPLEX channel!"); \
} while (0)

#define checkChannel(h) do { \
    checkIfNil(h); \
    checkTypeOfChannel(h); \
} while (0)


/* -------------------------------------------------------------------------- */
/* termination signal */
#define checkTypeOfTermination(te) do { \
    if ( (TYPEOF(te) != EXTPTRSXP) || \
         (R_ExternalPtrTag(te) != tagCPLEXtermination) ) \
        Rf_error("You must pass a pointer to a termination signal!"); \
} while (0)

#define checkTermination(ter) do { \
    checkIfNil(ter); \
    checkTypeOfTermination(ter); \
} while (0)


/* -------------------------------------------------------------------------- */
/* check status of ILOG CPLEX functions */
void status_message(CPXENVptr env, int status);

/* user messages */
void user_message (void *handle, char *message);

/* set a status value (SEXP) to class 'cpxerr' */
void set_to_CPXERR (SEXP stat);

/* cplex errors */
SEXP cpx_error (int errv);

/* cplex return value of a function (integer) */
SEXP cpx_ret_intval (int value);

/* cplex return value of a function (double) */
SEXP cpx_ret_dblval (double value);

/* cplex return value of a function (string) */
SEXP cpx_ret_strval (const char *value);


