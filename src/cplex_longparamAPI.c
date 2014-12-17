/* cplex_longparamAPI.c
   R Interface to C API of IBM ILOG CPLEX Version 12.1 to 12.6.

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


#include "cplex_longparamAPI.h"

int longsstat = 0;

/* -------------------------------------------------------------------------- */
/* routines handling paramters of type CPX_PARAMTYPE_LONG (new in 12.3.0.0)   */
/* -------------------------------------------------------------------------- */

#if defined(CPX_VERSION) && (CPX_VERSION >= 12030000)

/* -------------------------------------------------------------------------- */
/* set CPLEX paramters of type CPXLONG */
SEXP setLongParm(SEXP env, SEXP parm, SEXP value) {

    SEXP out = R_NilValue;

    checkTypeOfEnv(env);

    /*
    longsstat = CPXsetlongparam(R_ExternalPtrAddr(env), Rf_asInteger(parm),
                                (CPXLONG) Rf_asInteger(value)
                               );
    */
    longsstat = CPXsetlongparam(R_ExternalPtrAddr(env), Rf_asInteger(parm),
                                (CPXLONG) Rf_asReal(value)
                               );

    if (longsstat != 0) {
        status_message(R_ExternalPtrAddr(env), longsstat);
    }

    out = Rf_ScalarInteger(longsstat);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get CPLEX paramters of type CPXLONG */
SEXP getLongParm(SEXP env, SEXP parm) {

    SEXP out = R_NilValue;
    CPXLONG value;

    checkTypeOfEnv(env);

    longsstat = CPXgetlongparam(R_ExternalPtrAddr(env), Rf_asInteger(parm),
                                &value
                               );
    if (longsstat != 0) {
        status_message(R_ExternalPtrAddr(env), longsstat);
        out = cpx_error(longsstat);
    }
    else {
        /* out = Rf_ScalarInteger( (int) value ); */
        out = Rf_ScalarReal( (double) value );
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* get the default value and range of a CPLEX prarmeter of type CPXLONG */
SEXP getInfoLongParm(SEXP env, SEXP parm) {

    SEXP out    = R_NilValue;
    SEXP listv  = R_NilValue;

    CPXLONG defval, minval, maxval;

    checkTypeOfEnv(env);

    longsstat = CPXinfolongparam(R_ExternalPtrAddr(env), Rf_asInteger(parm),
                                 &defval, &minval, &maxval
                                );
    if (longsstat != 0) {
        status_message(R_ExternalPtrAddr(env), longsstat);
        out = cpx_error(longsstat);
    }
    else {
        PROTECT(out = Rf_allocVector(VECSXP, 3));
        /*
        SET_VECTOR_ELT(out, 0, Rf_ScalarInteger( (int) defval) );
        SET_VECTOR_ELT(out, 1, Rf_ScalarInteger( (int) minval) );
        SET_VECTOR_ELT(out, 2, Rf_ScalarInteger( (int) maxval) );
        */
        SET_VECTOR_ELT(out, 0, Rf_ScalarReal( (double) defval) );
        SET_VECTOR_ELT(out, 1, Rf_ScalarReal( (double) minval) );
        SET_VECTOR_ELT(out, 2, Rf_ScalarReal( (double) maxval) );

        PROTECT(listv = Rf_allocVector(STRSXP, 3));
        SET_STRING_ELT(listv, 0, Rf_mkChar("defvalue"));
        SET_STRING_ELT(listv, 1, Rf_mkChar("minvalue"));
        SET_STRING_ELT(listv, 2, Rf_mkChar("maxvalue"));
        Rf_setAttrib(out, R_NamesSymbol, listv);

        UNPROTECT(2);
    }

    return out;
}


#endif

