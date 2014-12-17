/* cplex_checkAPI.c
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


#include "cplex_checkAPI.h"


int chkstat = 0;


/* -------------------------------------------------------------------------- */
/* diagnostic routines for debugging                                          */
/* -------------------------------------------------------------------------- */

#ifdef USE_CHECK

/* -------------------------------------------------------------------------- */
/* validate the arguments of the corresponding CPXcopylp routine */
SEXP checkCopyLp(SEXP env, SEXP lp, SEXP nCols, SEXP nRows, SEXP lpdir,
                 SEXP objf, SEXP rhs, SEXP sense,
                 SEXP matbeg, SEXP matcnt, SEXP matind, SEXP matval,
                 SEXP lb, SEXP ub, SEXP rngval) {

    SEXP out = R_NilValue;

    const double *robjf   = REAL(objf);
    const double *rrhs    = REAL(rhs);
    const char *rsense    = CHAR(STRING_ELT(sense, 0));
    const int *rmatbeg    = INTEGER(matbeg);
    const int *rmatcnt    = INTEGER(matcnt);
    const int *rmatind    = INTEGER(matind);
    const double *rmatval = REAL(matval);
    const double *rlb     = REAL(lb);
    const double *rub     = REAL(ub);
    const double *rrngval;

    checkTypeOfEnv(env);
    checkTypeOfProb(lp);

    if (rngval == R_NilValue) {
        rrngval = NULL;
    }
    else {
        rrngval = REAL(rngval);
    }

    chkstat = CPXcheckcopylp(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                             Rf_asInteger(nCols), Rf_asInteger(nRows),
                             Rf_asInteger(lpdir), robjf, rrhs, rsense,
                             rmatbeg, rmatcnt, rmatind, rmatval,
                             rlb, rub, rrngval
                            );
    if (chkstat != 0) {
        status_message(R_ExternalPtrAddr(env), chkstat);
    }

    out = Rf_ScalarInteger(chkstat);

    return out;
}


/* -------------------------------------------------------------------------- */
/* validate the arguments of the corresponding CPXcopylpwnames routine */
SEXP checkCopyLpwNames(SEXP env, SEXP lp, SEXP nCols, SEXP nRows, SEXP lpdir,
                       SEXP objf, SEXP rhs, SEXP sense,
                       SEXP matbeg, SEXP matcnt, SEXP matind, SEXP matval,
                       SEXP lb, SEXP ub, SEXP rngval,
                       SEXP cnames, SEXP rnames) {

    SEXP out = R_NilValue;

    int k, numcn, numrn;
    const double *robjf   = REAL(objf);
    const double *rrhs    = REAL(rhs);
    const char *rsense    = CHAR(STRING_ELT(sense, 0));
    const int *rmatbeg    = INTEGER(matbeg);
    const int *rmatcnt    = INTEGER(matcnt);
    const int *rmatind    = INTEGER(matind);
    const double *rmatval = REAL(matval);
    const double *rlb     = REAL(lb);
    const double *rub     = REAL(ub);
    const double *rrngval;
    const char **rcnames;
    const char ** rrnames;

    checkTypeOfEnv(env);
    checkTypeOfProb(lp);

    if (rngval == R_NilValue) {
        rrngval = NULL;
    }
    else {
        rrngval = REAL(rngval);
    }

    if (cnames == R_NilValue) {
        rcnames = NULL;
    }
    else {
        numcn = Rf_length(cnames);
        rcnames = R_Calloc(numcn, const char *);
        for (k = 0; k < numcn; k++) {
            rcnames[k] = CHAR(STRING_ELT(cnames, k));
        }
    }

    if (rnames == R_NilValue) {
        rrnames = NULL;
    }
    else {
        numrn = Rf_length(rnames);
        rrnames = R_Calloc(numrn, const char *);
        for (k = 0; k < numrn; k++) {
            rrnames[k] = CHAR(STRING_ELT(rnames, k));
        }
    }

    chkstat = CPXcheckcopylpwnames(R_ExternalPtrAddr(env),
                                   R_ExternalPtrAddr(lp),
                                   Rf_asInteger(nCols), Rf_asInteger(nRows),
                                   Rf_asInteger(lpdir), robjf, rrhs, rsense,
                                   rmatbeg, rmatcnt, rmatind, rmatval,
                                   rlb, rub, rrngval,
                                   (char **) rcnames, (char **) rrnames
                                  );
    if (chkstat != 0) {
        status_message(R_ExternalPtrAddr(env), chkstat);
    }

    if (cnames != R_NilValue) {
        R_Free(rcnames);
    }
    if (rnames != R_NilValue) {
        R_Free(rrnames);
    }

    out = Rf_ScalarInteger(chkstat);

    return out;
}


/* -------------------------------------------------------------------------- */
/* validate the arguments of the corresponding CPXcopyquad routine */
SEXP checkCopyQuad(SEXP env, SEXP lp,
                   SEXP qmatbeg, SEXP qmatcnt, SEXP qmatind, SEXP qmatval) {

    SEXP out = R_NilValue;

    const int *rqmatbeg    = INTEGER(qmatbeg);
    const int *rqmatcnt    = INTEGER(qmatcnt);
    const int *rqmatind    = INTEGER(qmatind);
    const double *rqmatval = REAL(qmatval);

    checkTypeOfEnv(env);
    checkTypeOfProb(lp);

    chkstat = CPXcheckcopyquad(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                               rqmatbeg, rqmatcnt, rqmatind, rqmatval
                              );

    if (chkstat != 0) {
        status_message(R_ExternalPtrAddr(env), chkstat);
    }

    out = Rf_ScalarInteger(chkstat);

    return out;
}


/* -------------------------------------------------------------------------- */
/* validate the arguments of the corresponding CPXcopyqpsep routine */
SEXP checkCopyQPsep(SEXP env, SEXP lp, SEXP qsepvec) {

    SEXP out = R_NilValue;

    const double *rqsepvec = REAL(qsepvec);

    checkEnv(env);
    checkProb(lp);

    chkstat = CPXcheckcopyqpsep(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                rqsepvec
                               );

    if (chkstat != 0) {
        status_message(R_ExternalPtrAddr(env), chkstat);
    }

    out = Rf_ScalarInteger(chkstat);

    return out;
}


/* -------------------------------------------------------------------------- */
/* validate the arguments of the corresponding CPXaddrows routine */
SEXP checkAddRows(SEXP env, SEXP lp, SEXP ncols, SEXP nrows, SEXP nnz,
                  SEXP rhs, SEXP sense, SEXP matbeg, SEXP matind, SEXP matval,
                  SEXP cnames, SEXP rnames) {

    SEXP out = R_NilValue;

    int k, numcn, numrn;
    const int *rmatbeg    = INTEGER(matbeg);
    const int *rmatind    = INTEGER(matind);
    const double *rmatval = REAL(matval);
    const double *rrhs;
    const char *rsense;
    const char **rcnames;
    const char **rrnames;

    checkTypeOfEnv(env);
    checkTypeOfProb(lp);

    if (rhs == R_NilValue) {
        rrhs = NULL;
    }
    else {
        rrhs = REAL(rhs);
    }

    if (sense == R_NilValue) {
        rsense = NULL;
    }
    else {
        rsense = CHAR(STRING_ELT(sense, 0));
    }

    if (cnames == R_NilValue) {
        rcnames = NULL;
    }
    else {
        numcn = Rf_length(cnames);
        rcnames = R_Calloc(numcn, const char *);
        for (k = 0; k < numcn; k++) {
            rcnames[k] = CHAR(STRING_ELT(cnames, k));
        }
    }

    if (rnames == R_NilValue) {
        rrnames = NULL;
    }
    else {
        numrn = Rf_length(rnames);
        rrnames = R_Calloc(numrn, const char *);
        for (k = 0; k < numrn; k++) {
            rrnames[k] = CHAR(STRING_ELT(rnames, k));
        }
    }

    chkstat = CPXcheckaddrows(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                              Rf_asInteger(ncols), Rf_asInteger(nrows),
                              Rf_asInteger(nnz), rrhs, rsense,
                              rmatbeg, rmatind, rmatval,
                              (char **) rcnames, (char **) rrnames
                             );
    if (chkstat != 0) {
        status_message(R_ExternalPtrAddr(env), chkstat);
    }

    if (cnames != R_NilValue) {
        R_Free(rcnames);
    }
    if (rnames != R_NilValue) {
        R_Free(rrnames);
    }

    out = Rf_ScalarInteger(chkstat);

    return out;
}


/* -------------------------------------------------------------------------- */
/* validate the arguments of the corresponding CPXaddcols routine */
SEXP checkAddCols(SEXP env, SEXP lp, SEXP ncols, SEXP nnz, SEXP objf,
                  SEXP matbeg, SEXP matind, SEXP matval,
                  SEXP lb, SEXP ub, SEXP cnames) {

    SEXP out = R_NilValue;

    int k, nnames;
    const double *robjf   = REAL(objf);
    const int *rmatbeg    = INTEGER(matbeg);
    const int *rmatind    = INTEGER(matind);
    const double *rmatval = REAL(matval);
    const double *rlb, *rub;
    const char **rcnames;

    checkTypeOfEnv(env);
    checkTypeOfProb(lp);

    if (lb == R_NilValue) {
        rlb = NULL;
    }
    else {
        rlb = REAL(lb);
    }

    if (ub == R_NilValue) {
        rub = NULL;
    }
    else {
        rub = REAL(ub);
    }

    if (cnames == R_NilValue) {
        rcnames = NULL;
    }
    else {
        nnames = Rf_length(cnames);
        rcnames = R_Calloc(nnames, const char *);
        for (k = 0; k < nnames; k++) {
            rcnames[k] = CHAR(STRING_ELT(cnames, k));
        }
    }

    chkstat = CPXcheckaddcols(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                              Rf_asInteger(ncols), Rf_asInteger(nnz),
                              robjf, rmatbeg, rmatind, rmatval,
                              rlb, rub, (char **) rcnames
                             );
    if (chkstat != 0) {
        status_message(R_ExternalPtrAddr(env), chkstat);
    }

    if (cnames != R_NilValue) {
        R_Free(rcnames);
    }

    out = Rf_ScalarInteger(chkstat);

    return out;
}


/* -------------------------------------------------------------------------- */
/* validate the arguments of the corresponding CPXchgcoeflist routine */
SEXP checkChgCoefList(SEXP env, SEXP lp, SEXP nnz, SEXP ia, SEXP ja, SEXP ra) {

    SEXP out = R_NilValue;

    const int *ria = INTEGER(ia);
    const int *rja = INTEGER(ja);
    const double *rra = REAL(ra);

    checkTypeOfEnv(env);
    checkTypeOfProb(lp);

    chkstat = CPXcheckchgcoeflist(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                  Rf_asInteger(nnz), ria, rja, rra
                                 );
    if (chkstat != 0) {
        status_message(R_ExternalPtrAddr(env), chkstat);
    }

    out = Rf_ScalarInteger(chkstat);

    return out;
}


/* -------------------------------------------------------------------------- */
/* validate the arguments of the corresponding CPXcopyctype routine */
SEXP checkCopyColType(SEXP env, SEXP lp, SEXP xctype) {

    SEXP out = R_NilValue;

    const char *rxctype = CHAR(STRING_ELT(xctype, 0));

    checkTypeOfEnv(env);
    checkTypeOfProb(lp);

    chkstat = CPXcheckcopyctype(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                rxctype
                               );
    if (chkstat != 0) {
        status_message(R_ExternalPtrAddr(env), chkstat);
    }

    out = Rf_ScalarInteger(chkstat);

    return out;
}


/* -------------------------------------------------------------------------- */
/* check an array of indices and a corresponding array of values
   for input errors */
SEXP checkVals(SEXP env, SEXP lp, SEXP nval, SEXP rind, SEXP cind, SEXP val) {

    SEXP out = R_NilValue;

    const int *rrind;
    const int *rcind;
    const double *rval;

    checkTypeOfEnv(env);
    checkTypeOfProb(lp);

    if (rind == R_NilValue) {
        rrind = NULL;
    }
    else {
        rrind = INTEGER(rind);
    }

    if (cind == R_NilValue) {
        rcind = NULL;
    }
    else {
        rcind = INTEGER(cind);
    }

    if (val == R_NilValue) {
        rval = NULL;
    }
    else {
        rval = REAL(val);
    }

    chkstat = CPXcheckvals(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                           Rf_asInteger(nval), rrind, rcind, rval
                          );
    if (chkstat != 0) {
        status_message(R_ExternalPtrAddr(env), chkstat);
    }

    out = Rf_ScalarInteger(chkstat);

    return out;
}

#endif

