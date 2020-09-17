/* cplexR.c
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


#include "cplexR.h"


SEXP tagCPLEXprob;
SEXP tagCPLEXenv;
SEXP tagCPLEXfile;
SEXP tagCPLEXchannel;
SEXP tagCPLEXtermination;


/* -------------------------------------------------------------------------- */
/* check status of ILOG CPLEX functions                                       */
/* -------------------------------------------------------------------------- */

char errmsg[CPLEXAPIMSGBUFF];

void status_message (CPXENVptr env, int status) {

    CPXCCHARptr errorString;
    errorString = CPXgeterrorstring(env, status, errmsg);

    if (errorString != NULL) {
        REprintf("\n%s\n", errmsg);
    }
    else {
        REprintf("\nCPLEX Error %5d: Unknown error code.\n", status);
    }

}

/* user messages */
void user_message (void *handle, char *message) {

    FILE *fl;
    fl = (FILE *)handle;
    fprintf(fl, "%s\n", message);

}


/* set a status value (SEXP) to class 'cpxerr' */
void set_to_CPXERR (SEXP stat) {

    SEXP class = R_NilValue;

    PROTECT(class = Rf_allocVector(STRSXP, 1));
    SET_STRING_ELT(class, 0, Rf_mkChar("cpxerr"));
    Rf_classgets(stat, class);
    UNPROTECT(1);

}


/* cplex errors */
SEXP cpx_error (int errv) {

    SEXP out   = R_NilValue;

    PROTECT(out = Rf_allocVector(INTSXP, 1));
    INTEGER(out)[0] = errv;
    set_to_CPXERR(out);

    UNPROTECT(1);

    return out;

}


/* cplex return value of a function (integer) */
SEXP cpx_ret_intval (int value) {

    SEXP out = R_NilValue;

    PROTECT(out = Rf_allocVector(INTSXP, 1));
    INTEGER(out)[0] = value;
    UNPROTECT(1);

    return out;

}


/* cplex return value of a function (double) */
SEXP cpx_ret_dblval (double value) {

    SEXP out = R_NilValue;

    PROTECT(out = Rf_allocVector(REALSXP, 1));
    REAL(out)[0] = value;
    UNPROTECT(1);

    return out;

}


/* cplex return value of a function (string) */
SEXP cpx_ret_strval (const char *value) {

    SEXP out = R_NilValue;

    PROTECT(out = Rf_allocVector(STRSXP, 1));
    SET_STRING_ELT(out, 0, Rf_mkChar(value));
    UNPROTECT(1);

    return out;

}




