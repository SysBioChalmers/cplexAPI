/* cplexAPI.c
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


#include "cplexAPI.h"


int status = 0;
volatile int terminate;


/* -------------------------------------------------------------------------- */
/* finalizer for cplex environments */
static void cplexEnvFinalizer (SEXP env) {
    if (!R_ExternalPtrAddr(env)) {
        return;
    }
    else {
        closeEnv(env);
    }
}

/* finalizer for cplex problems

There is only a finalizer for the CPLEX environment. If the environment is
removed, all memory allocated by CPLEX will be returned to the OS.
Alternative: make the environment a global variable, now you can have
appropiate finalizers for all pointers. Disadvantage: parameter settings
are only valid for a specific environment. So, one can only have one
parameter setting per R session.

static void cplexProbFinalizer (SEXP lp, SEXP env) {
    
    if ( (!R_ExternalPtrAddr(lp)) || (!R_ExternalPtrAddr(env)) ) {
        return;
    }
    else {
        delProb(env, lp);
    }
}
*/


/* -------------------------------------------------------------------------- */
/* help functions                                                             */
/* -------------------------------------------------------------------------- */

/* check for pointer to CPLEX problem object */
SEXP isCPLEXprobPtr(SEXP ptr) {

    SEXP out = R_NilValue;

    if ( (TYPEOF(ptr) == EXTPTRSXP) &&
         (R_ExternalPtrTag(ptr) == tagCPLEXprob) ) {
        out = Rf_ScalarLogical(1);
    }
    else {
        out = Rf_ScalarLogical(0);
    }

    return out;
}

/* check for pointer to CPLEX environment */
SEXP isCPLEXenvPtr(SEXP ptr) {

    SEXP out = R_NilValue;

    if ( (TYPEOF(ptr) == EXTPTRSXP) &&
         (R_ExternalPtrTag(ptr) == tagCPLEXenv) ) {
        out = Rf_ScalarLogical(1);
    }
    else {
        out = Rf_ScalarLogical(0);
    }

    return out;
}

/* check for pointer to CPLEX file */
SEXP isCPLEXfilePtr(SEXP ptr) {

    SEXP out = R_NilValue;

    if ( (TYPEOF(ptr) == EXTPTRSXP) &&
         (R_ExternalPtrTag(ptr) == tagCPLEXfile) ) {
        out = Rf_ScalarLogical(1);
    }
    else {
        out = Rf_ScalarLogical(0);
    }

    return out;
}

/* check for pointer to CPLEX channel */
SEXP isCPLEXchanPtr(SEXP ptr) {

    SEXP out = R_NilValue;

    if ( (TYPEOF(ptr) == EXTPTRSXP) &&
         (R_ExternalPtrTag(ptr) == tagCPLEXchannel) ) {
        out = Rf_ScalarLogical(1);
    }
    else {
        out = Rf_ScalarLogical(0);
    }

    return out;
}

/* check for pointer to CPLEX termination signal */
SEXP isCPLEXtermPtr(SEXP ptr) {

    SEXP out = R_NilValue;

    if ( (TYPEOF(ptr) == EXTPTRSXP) &&
         (R_ExternalPtrTag(ptr) == tagCPLEXtermination) ) {
        out = Rf_ScalarLogical(1);
    }
    else {
        out = Rf_ScalarLogical(0);
    }

    return out;
}

/* check for NULL pointer */
SEXP isNULLptr(SEXP ptr) {

    SEXP out = R_NilValue;

    if ( (TYPEOF(ptr) == EXTPTRSXP) &&
         (R_ExternalPtrAddr(ptr) == NULL) ) {
        out = Rf_ScalarLogical(1);
    }
    else {
        out = Rf_ScalarLogical(0);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* API functions                                                              */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/* return error message string */
SEXP getErrorStr(SEXP env, SEXP err) {

    SEXP out = R_NilValue;
    CPXCCHARptr errorString;
    CPXENVptr Cenv;

    if (env == R_NilValue) {
        Cenv = NULL;
    }
    else {
        checkEnv(env);
        Cenv = R_ExternalPtrAddr(env);
    }

    errorString = CPXgeterrorstring(Cenv, Rf_asInteger(err), errmsg);

    if (errorString == NULL) {
        sprintf(errmsg,
                "CPLEX Error %5d: Unknown error code.\n", Rf_asInteger(err));
    }

    out = Rf_mkString(errmsg);

    return out;

}


/* -------------------------------------------------------------------------- */
/* return status string */
SEXP getStatStr(SEXP env, SEXP stat) {

    SEXP out = R_NilValue;
    CPXCHARptr statusString;
    char statmsg[510];

    checkEnv(env);

    statusString = CPXgetstatstring(R_ExternalPtrAddr(env), Rf_asInteger(stat),
                                    statmsg
                                   );

    if (statusString == NULL) {
        strcpy(statmsg, "Unknown status code.");
    }

    out = Rf_mkString(statmsg);

    return out;

}


/* -------------------------------------------------------------------------- */
/* initialize cplex */
SEXP initCPLEX(void) {
    tagCPLEXprob        = Rf_install("TYPE_CPLEX_PROB");
    tagCPLEXenv         = Rf_install("TYPE_CPLEX_ENV");
    tagCPLEXfile        = Rf_install("TYPE_CPLEX_FILE");
    tagCPLEXchannel     = Rf_install("TYPE_CPLEX_CHANNEL");
    tagCPLEXtermination = Rf_install("TYPE_CPLEX_TERMINATION");
    return R_NilValue;
}


/* -------------------------------------------------------------------------- */
/* close cplex environment */
SEXP closeEnv(SEXP env) {

    SEXP out = R_NilValue;
    CPXENVptr del = NULL;

    checkEnv(env);

    del = R_ExternalPtrAddr(env);

    status = CPXcloseCPLEX(&del);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        R_ClearExternalPtr(env);
        out = Rf_ScalarInteger(status);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* open cplex environment */
SEXP openEnv(SEXP ptrtype) {

    SEXP envext = R_NilValue;
    SEXP ptr, class;

    CPXENVptr env = NULL;

    env = CPXopenCPLEX(&status);

    if (status != 0) {
        status_message(env, status);
        ptr = cpx_error(status);
    }
    else {
        /* create environment pointer */
        PROTECT(ptr = Rf_allocVector(STRSXP, 1));
        SET_STRING_ELT(ptr, 0, STRING_ELT(ptrtype, 0));
        
        PROTECT(class = Rf_allocVector(STRSXP, 1));
        SET_STRING_ELT(class, 0, Rf_mkChar("cplex_env_ptr"));

        envext = R_MakeExternalPtr(env, tagCPLEXenv, R_NilValue);
        PROTECT(envext);
        R_RegisterCFinalizerEx(envext, cplexEnvFinalizer, TRUE);
        Rf_setAttrib(ptr, class, envext);
        Rf_classgets(ptr, class);
        UNPROTECT(3);
    }

    return ptr;
}


/* -------------------------------------------------------------------------- */
/* remove problem object */
SEXP delProb(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    CPXLPptr del = NULL;

    checkEnv(env);
    checkProb(lp);

    del = R_ExternalPtrAddr(lp);

    status = CPXfreeprob(R_ExternalPtrAddr(env), &del);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        R_ClearExternalPtr(lp);
        out = Rf_ScalarInteger(status);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* create new problem object */
SEXP initProb(SEXP env, SEXP pname, SEXP ptrtype) {

    SEXP lpext = R_NilValue;
    SEXP ptr, class;

    CPXLPptr lp = NULL;

    const char *rpname = CHAR(STRING_ELT(pname, 0));

    checkEnv(env);

    lp = CPXcreateprob(R_ExternalPtrAddr(env), &status, rpname);

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        ptr = cpx_error(status);
    }
    else {
        /* create problem pointer */
        PROTECT(ptr = Rf_allocVector(STRSXP, 1));
        SET_STRING_ELT(ptr, 0, STRING_ELT(ptrtype, 0));
        
        PROTECT(class = Rf_allocVector(STRSXP, 1));
        SET_STRING_ELT(class, 0, Rf_mkChar("cplex_prob_ptr"));

        lpext = R_MakeExternalPtr(lp, tagCPLEXprob, R_NilValue);
        PROTECT(lpext);
        /* R_RegisterCFinalizerEx(lpext, cplexProbFinalizer, TRUE); */
        Rf_setAttrib(ptr, class, lpext);
        Rf_classgets(ptr, class);
        UNPROTECT(3);
    }

    return ptr;
}


/* -------------------------------------------------------------------------- */
/* clone problem object */
SEXP cloneProb(SEXP env, SEXP lp, SEXP ptrtype) {

    SEXP lpext = R_NilValue;
    SEXP ptr, class;

    CPXLPptr clp = NULL;

    checkEnv(env);
    checkProb(lp);

    clp = CPXcloneprob(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp), &status);

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        ptr = cpx_error(status);
    }
    else {
        /* create problem pointer */
        PROTECT(ptr = Rf_allocVector(STRSXP, 1));
        SET_STRING_ELT(ptr, 0, STRING_ELT(ptrtype, 0));
        
        PROTECT(class = Rf_allocVector(STRSXP, 1));
        SET_STRING_ELT(class, 0, Rf_mkChar("cplex_prob_ptr"));

        lpext = R_MakeExternalPtr(clp, tagCPLEXprob, R_NilValue);
        PROTECT(lpext);
        Rf_setAttrib(ptr, class, lpext);
        Rf_classgets(ptr, class);
        UNPROTECT(3);
    }

    return ptr;
}


/* -------------------------------------------------------------------------- */
/* access the problem type that is currently stored in a problem object */
SEXP getProbType(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    int ptype = -1;

    checkEnv(env);
    checkProb(lp);

    ptype = CPXgetprobtype(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(ptype);

    return out;
}


/* -------------------------------------------------------------------------- */
/* change the current problem to a related problem */
SEXP chgProbType(SEXP env, SEXP lp, SEXP ptype) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXchgprobtype(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                            Rf_asInteger(ptype));
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get cplex version number */
SEXP getVersion(SEXP env) {

    SEXP out = R_NilValue;
    const char *ver;

    checkEnv(env);

    ver = CPXversion(R_ExternalPtrAddr(env));

    out = Rf_mkString(ver);

    return out;
}


/* -------------------------------------------------------------------------- */
/* set CPLEX default paramters */
SEXP setDefaultParm(SEXP env) {

    SEXP out = R_NilValue;

    checkEnv(env);

    status = CPXsetdefaults(R_ExternalPtrAddr(env));
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* set CPLEX paramters of integer type */
SEXP setIntParm(SEXP env, SEXP parm, SEXP value) {

    SEXP out = R_NilValue;

    checkEnv(env);

    status = CPXsetintparam(R_ExternalPtrAddr(env), Rf_asInteger(parm),
                            Rf_asInteger(value)
                           );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get CPLEX paramters of integer type */
SEXP getIntParm(SEXP env, SEXP parm) {

    SEXP out = R_NilValue;
    int value;

    checkEnv(env);

    status = CPXgetintparam(R_ExternalPtrAddr(env), Rf_asInteger(parm), &value);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarInteger(value);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* get the default value and range of a CPLEX prarmeter of type integer */
SEXP getInfoIntParm(SEXP env, SEXP parm) {

    SEXP out    = R_NilValue;
    SEXP listv  = R_NilValue;

    int defval, minval, maxval;

    checkEnv(env);

    status = CPXinfointparam(R_ExternalPtrAddr(env), Rf_asInteger(parm),
                             &defval, &minval, &maxval
                            );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        PROTECT(out = Rf_allocVector(VECSXP, 3));
        SET_VECTOR_ELT(out, 0, Rf_ScalarInteger(defval));
        SET_VECTOR_ELT(out, 1, Rf_ScalarInteger(minval));
        SET_VECTOR_ELT(out, 2, Rf_ScalarInteger(maxval));

        PROTECT(listv = Rf_allocVector(STRSXP, 3));
        SET_STRING_ELT(listv, 0, Rf_mkChar("defvalue"));
        SET_STRING_ELT(listv, 1, Rf_mkChar("minvalue"));
        SET_STRING_ELT(listv, 2, Rf_mkChar("maxvalue"));
        Rf_setAttrib(out, R_NamesSymbol, listv);

        UNPROTECT(2);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* set CPLEX paramters of double type */
SEXP setDblParm(SEXP env, SEXP parm, SEXP value) {

    SEXP out = R_NilValue;

    checkEnv(env);

    status = CPXsetdblparam(R_ExternalPtrAddr(env), Rf_asInteger(parm),
                            Rf_asReal(value)
                           );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get CPLEX paramters of double type */
SEXP getDblParm(SEXP env, SEXP parm) {

    SEXP out = R_NilValue;
    double value;

    checkEnv(env);

    status = CPXgetdblparam(R_ExternalPtrAddr(env), Rf_asInteger(parm), &value);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarReal(value);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* get the default value and range of a CPLEX prarmeter of type double */
SEXP getInfoDblParm(SEXP env, SEXP parm) {

    SEXP out    = R_NilValue;
    SEXP listv  = R_NilValue;

    double defval, minval, maxval;

    checkEnv(env);

    status = CPXinfodblparam(R_ExternalPtrAddr(env), Rf_asInteger(parm),
                             &defval, &minval, &maxval
                            );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        PROTECT(out = Rf_allocVector(VECSXP, 3));
        SET_VECTOR_ELT(out, 0, Rf_ScalarReal(defval));
        SET_VECTOR_ELT(out, 1, Rf_ScalarReal(minval));
        SET_VECTOR_ELT(out, 2, Rf_ScalarReal(maxval));

        PROTECT(listv = Rf_allocVector(STRSXP, 3));
        SET_STRING_ELT(listv, 0, Rf_mkChar("defvalue"));
        SET_STRING_ELT(listv, 1, Rf_mkChar("minvalue"));
        SET_STRING_ELT(listv, 2, Rf_mkChar("maxvalue"));
        Rf_setAttrib(out, R_NamesSymbol, listv);

        UNPROTECT(2);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* set CPLEX paramters of string type */
SEXP setStrParm(SEXP env, SEXP parm, SEXP value) {

    SEXP out = R_NilValue;
    const char *rvalue = CHAR(STRING_ELT(value, 0));

    checkEnv(env);

    status = CPXsetstrparam(R_ExternalPtrAddr(env), Rf_asInteger(parm), rvalue);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get CPLEX paramters of string type */
SEXP getStrParm(SEXP env, SEXP parm) {

    SEXP out = R_NilValue;

    char strp[CPX_STR_PARAM_MAX];

    checkEnv(env);

    status = CPXgetstrparam(R_ExternalPtrAddr(env), Rf_asInteger(parm), strp);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_mkString(strp);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get the default value of a CPLEX prarmeter of type string */
SEXP getInfoStrParm(SEXP env, SEXP parm) {

    SEXP out = R_NilValue;

    char strp[CPX_STR_PARAM_MAX];

    checkEnv(env);

    status = CPXinfostrparam(R_ExternalPtrAddr(env), Rf_asInteger(parm), strp);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_mkString(strp);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get a parameter name */
SEXP getParmName(SEXP env, SEXP wparm) {

    SEXP out = R_NilValue;

    char nparm[CPX_STR_PARAM_MAX];

    checkEnv(env);

    status = CPXgetparamname(R_ExternalPtrAddr(env), Rf_asInteger(wparm),
                             nparm
                            );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_mkString(nparm);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get a parameter reference number */
SEXP getParmNum(SEXP env, SEXP nparm) {

    SEXP out = R_NilValue;

    const char *rnparm = CHAR(STRING_ELT(nparm, 0));
    int wparm;

    checkEnv(env);

    status = CPXgetparamnum(R_ExternalPtrAddr(env), rnparm, &wparm);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(wparm);

    return out;
}


/* -------------------------------------------------------------------------- */
/* reads parameter names and settings from a file */
SEXP readCopyParm(SEXP env, SEXP fname) {

    SEXP out = R_NilValue;

    const char *rfname = CHAR(STRING_ELT(fname, 0));

    checkEnv(env);

    status = CPXreadcopyparam(R_ExternalPtrAddr(env), rfname);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* write the name and current setting of CPLEX parameters that are not at their
   default setting to a text file */
SEXP writeParm(SEXP env, SEXP fname) {

    SEXP out = R_NilValue;

    const char *rfname = CHAR(STRING_ELT(fname, 0));

    checkEnv(env);

    status = CPXwriteparam(R_ExternalPtrAddr(env), rfname);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get parameter type */
SEXP getParmType(SEXP env, SEXP parm) {

    SEXP out = R_NilValue;

    int parmT;

    checkEnv(env);

    status = CPXgetparamtype(R_ExternalPtrAddr(env), Rf_asInteger(parm),
                             &parmT
                            );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarInteger(parmT);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* get an array of parameter numbers for parameters which are not set at their
   default values */
SEXP getChgParm(SEXP env) {

    SEXP out = R_NilValue;
    SEXP parmNum = R_NilValue;

    int sp, ret;
    int lg = 0;

    checkEnv(env);

    ret = CPXgetchgparam(R_ExternalPtrAddr(env), &lg, NULL, 0, &sp);

    if (ret == CPXERR_NEGATIVE_SURPLUS) {
    /* if (sp < 0) { */
        lg -= sp;
        PROTECT(parmNum = Rf_allocVector(INTSXP, lg));

        status = CPXgetchgparam(R_ExternalPtrAddr(env),
                                &lg, INTEGER(parmNum), lg, &sp
                               );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = parmNum;
        }
        UNPROTECT(1);
    }
    else {
        if (ret != 0) {
            status_message(R_ExternalPtrAddr(env), ret);
            out = cpx_error(ret);
        }
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* set optimization direction */
SEXP setObjDir(SEXP env, SEXP lp, SEXP lpdir) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    CPXchgobjsen(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                 Rf_asInteger(lpdir)
                );

    return out;
}


/* -------------------------------------------------------------------------- */
/* get optimization direction */
SEXP getObjDir(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    int lpdir = 0;

    checkEnv(env);

    lpdir = CPXgetobjsen(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(lpdir);

    return out;
}


/* -------------------------------------------------------------------------- */
/* copy data that define an LP problem to a problem object */
SEXP copyLp(SEXP env, SEXP lp, SEXP nCols, SEXP nRows, SEXP lpdir,
            SEXP objf, SEXP rhs, SEXP sense,
            SEXP matbeg, SEXP matcnt, SEXP matind, SEXP matval,
            SEXP lb, SEXP ub, SEXP rngval
           ) {

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

    checkEnv(env);
    checkProb(lp);

    if (rngval == R_NilValue) {
        rrngval = NULL;
    }
    else {
        rrngval = REAL(rngval);
    }

    status = CPXcopylp(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                       Rf_asInteger(nCols), Rf_asInteger(nRows),
                       Rf_asInteger(lpdir),
                       robjf, rrhs, rsense,
                       rmatbeg, rmatcnt, rmatind, rmatval,
                       rlb, rub, rrngval
                      );

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* copy LP data into a problem object in the same way as the routine CPXcopylp,
   but using some additional arguments to specify the names of constraints and
   variables in the problem object */
SEXP copyLpwNames(SEXP env, SEXP lp, SEXP nCols, SEXP nRows, SEXP lpdir,
                  SEXP objf, SEXP rhs, SEXP sense,
                  SEXP matbeg, SEXP matcnt, SEXP matind, SEXP matval,
                  SEXP lb, SEXP ub, SEXP rngval, SEXP cnames, SEXP rnames
                 ) {

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

    checkEnv(env);
    checkProb(lp);

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

    status = CPXcopylpwnames(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                             Rf_asInteger(nCols), Rf_asInteger(nRows),
                             Rf_asInteger(lpdir), robjf, rrhs, rsense,
                             rmatbeg, rmatcnt, rmatind, rmatval,
                             rlb, rub, rrngval,
                             (char **) rcnames, (char **) rrnames
                            );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    if (cnames != R_NilValue) {
        R_Free(rcnames);
    }
    if (rnames != R_NilValue) {
        R_Free(rrnames);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* copy a quadratic objective matrix Q when Q is not diagonal */
SEXP copyQuad(SEXP env, SEXP lp,
              SEXP qmatbeg, SEXP qmatcnt, SEXP qmatind, SEXP qmatval
             ) {

    SEXP out = R_NilValue;

    const int *rqmatbeg    = INTEGER(qmatbeg);
    const int *rqmatcnt    = INTEGER(qmatcnt);
    const int *rqmatind    = INTEGER(qmatind);
    const double *rqmatval = REAL(qmatval);

    checkEnv(env);
    checkProb(lp);

    status = CPXcopyquad(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                         rqmatbeg, rqmatcnt, rqmatind, rqmatval
                        );

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* copy the quadratic objective matrix Q for a separable QP problem */
SEXP copyQPsep(SEXP env, SEXP lp, SEXP qsepvec) {

    SEXP out = R_NilValue;

    const double *rqsepvec = REAL(qsepvec);

    checkEnv(env);
    checkProb(lp);

    status = CPXcopyqpsep(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          rqsepvec
                         );

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* write a problem as text file */
SEXP writeProb(SEXP env, SEXP lp, SEXP fname, SEXP ftype) {

    SEXP out = R_NilValue;

    const char *rftype;
    const char *rfname = CHAR(STRING_ELT(fname, 0));

    checkEnv(env);
    checkProb(lp);

    if (ftype == R_NilValue) {
        rftype = NULL;
    }
    else {
        rftype = CHAR(STRING_ELT(ftype, 0));
    }

    status = CPXwriteprob(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          rfname, rftype
                         );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* reads an MPS, LP, or SAV file into an existing problem object */
SEXP readCopyProb(SEXP env, SEXP lp, SEXP fname, SEXP ftype) {

    SEXP out = R_NilValue;

    const char *rftype;
    const char *rfname = CHAR(STRING_ELT(fname, 0));

    checkProb(lp);
    checkEnv(env);

    if (ftype == R_NilValue) {
        rftype = NULL;
    }
    else {
        rftype = CHAR(STRING_ELT(ftype, 0));
    }

    status = CPXreadcopyprob(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                             rfname, rftype
                            );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* write a dual formulation of the current problem object */
SEXP dualWrite(SEXP env, SEXP lp, SEXP fname) {

    SEXP out = R_NilValue;

    const char *rfname = CHAR(STRING_ELT(fname, 0));
    double osh;

    checkEnv(env);
    checkProb(lp);

    status = CPXdualwrite(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          rfname, &osh);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarReal(osh);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* performs presolve on a problem object */
SEXP presolve(SEXP env, SEXP lp, SEXP method) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXpresolve(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                            Rf_asInteger(method));
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access presolve status information for the columns and rows of the
   presolved problem in the original problem and of the original problem
   in the presolved problem */
SEXP getPreStat(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    SEXP listn = R_NilValue;

    SEXP pcstat  = R_NilValue;
    SEXP prstat  = R_NilValue;
    SEXP ocstat  = R_NilValue;
    SEXP orstat  = R_NilValue;

    int prestat;
    int nrows = 0;
    int ncols = 0;

    checkEnv(env);
    checkProb(lp);

    nrows = CPXgetnumrows(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    ncols = CPXgetnumcols(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    if ( (nrows > 0) && (ncols > 0) ) {

        PROTECT(pcstat  = Rf_allocVector(INTSXP, ncols));
        PROTECT(prstat  = Rf_allocVector(INTSXP, nrows));
        PROTECT(ocstat  = Rf_allocVector(INTSXP, ncols));
        PROTECT(orstat  = Rf_allocVector(INTSXP, nrows));

        status = CPXgetprestat(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                               &prestat,
                               INTEGER(pcstat), INTEGER(prstat),
                               INTEGER(ocstat), INTEGER(orstat)
                              );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            PROTECT(out = Rf_allocVector(VECSXP, 5));
            SET_VECTOR_ELT(out, 0, Rf_ScalarInteger(prestat));
            SET_VECTOR_ELT(out, 1, pcstat);
            SET_VECTOR_ELT(out, 2, prstat);
            SET_VECTOR_ELT(out, 3, ocstat);
            SET_VECTOR_ELT(out, 4, orstat);

            PROTECT(listn = Rf_allocVector(STRSXP, 5));
            SET_STRING_ELT(listn, 0, Rf_mkChar("prestat"));
            SET_STRING_ELT(listn, 1, Rf_mkChar("pcstat"));
            SET_STRING_ELT(listn, 2, Rf_mkChar("prstat"));
            SET_STRING_ELT(listn, 3, Rf_mkChar("ocstat"));
            SET_STRING_ELT(listn, 4, Rf_mkChar("orstat"));

            Rf_setAttrib(out, R_NamesSymbol, listn);

            UNPROTECT(2);
        }

        UNPROTECT(4);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* performs bound strengthening and detects redundant rows */
SEXP basicPresolve(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    SEXP listn = R_NilValue;

    SEXP redlb = R_NilValue;
    SEXP redub = R_NilValue;
    SEXP rstat = R_NilValue;

    int nrows = 0;
    int ncols = 0;

    checkEnv(env);
    checkProb(lp);

    nrows = CPXgetnumrows(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    ncols = CPXgetnumcols(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    if ( (nrows > 0) && (ncols > 0) ) {

        PROTECT(redlb  = Rf_allocVector(REALSXP, ncols));
        PROTECT(redub  = Rf_allocVector(REALSXP, ncols));
        PROTECT(rstat  = Rf_allocVector(INTSXP,  nrows));

        status = CPXbasicpresolve(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                  REAL(redlb), REAL(redub), INTEGER(rstat)
                                 );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            PROTECT(out = Rf_allocVector(VECSXP, 3));
            SET_VECTOR_ELT(out, 0, redlb);
            SET_VECTOR_ELT(out, 1, redub);
            SET_VECTOR_ELT(out, 2, rstat);

            PROTECT(listn = Rf_allocVector(STRSXP, 3));
            SET_STRING_ELT(listn, 0, Rf_mkChar("redlb"));
            SET_STRING_ELT(listn, 1, Rf_mkChar("redub"));
            SET_STRING_ELT(listn, 2, Rf_mkChar("rstat"));

            Rf_setAttrib(out, R_NamesSymbol, listn);

            UNPROTECT(2);
        }

        UNPROTECT(3);
    }
    return out;
}


/* -------------------------------------------------------------------------- */
/* write a presolved version of the problem to a file */
SEXP preslvWrite(SEXP env, SEXP lp, SEXP fname) {

    SEXP out = R_NilValue;

    const char *rfname = CHAR(STRING_ELT(fname, 0));
    double off;

    checkEnv(env);
    checkProb(lp);

    status = CPXpreslvwrite(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                            rfname, &off
                           );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarReal(off);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* return a pointer for the presolved problem */
SEXP getRedLp(SEXP env, SEXP lp, SEXP ptrtype) {

    SEXP lpext = R_NilValue;
    SEXP ptr, class;

    CPXCLPptr redlp = NULL;

    checkEnv(env);
    checkProb(lp);

    status = CPXgetredlp(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp), &redlp);

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        ptr = cpx_error(status);
    }
    else {
        if (redlp != NULL) {
            /* create problem pointer */
            PROTECT(ptr = Rf_allocVector(STRSXP, 1));
            SET_STRING_ELT(ptr, 0, STRING_ELT(ptrtype, 0));
            
            PROTECT(class = Rf_allocVector(STRSXP, 1));
            SET_STRING_ELT(class, 0, Rf_mkChar("cplex_prob_ptr"));

            lpext = R_MakeExternalPtr(&redlp, tagCPLEXprob, R_NilValue);
            PROTECT(lpext);
            Rf_setAttrib(ptr, class, lpext);
            Rf_classgets(ptr, class);
            UNPROTECT(3);
        }
        else {
            ptr = R_NilValue;
        }
    }

    return ptr;
}


/* -------------------------------------------------------------------------- */
/* return the objective offset between the original problem and
   the presolved problem */
SEXP getObjOffset(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    double ooff;

    checkEnv(env);
    checkProb(lp);

    status = CPXgetobjoffset(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                             &ooff
                            );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarReal(ooff);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* remove any scaling that CPLEX has applied to the resident problem and its
   associated data */
SEXP unscaleProb(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXunscaleprob(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* add new empty constraints (rows) to a problem object */
SEXP newRows(SEXP env, SEXP lp,
             SEXP nrows, SEXP rhs, SEXP sense, SEXP rngval, SEXP rnames) {

    SEXP out = R_NilValue;

    int k, nnames;
    const double *rrhs;
    const double *rrngval;
    const char *rsense;
    const char **rrnames;

    checkEnv(env);
    checkProb(lp);

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

    if (rngval == R_NilValue) {
        rrngval = NULL;
    }
    else {
        rrngval = REAL(rngval);
    }

    if (rnames == R_NilValue) {
        rrnames = NULL;
    }
    else {
        nnames = Rf_length(rnames);
        rrnames = R_Calloc(nnames, const char *);
        for (k = 0; k < nnames; k++) {
            rrnames[k] = CHAR(STRING_ELT(rnames, k));
        }
    }

    status = CPXnewrows(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                        Rf_asInteger(nrows), rrhs, rsense, rrngval,
                        (char **) rrnames
                       );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    if (rnames != R_NilValue) {
        R_Free(rrnames);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* add constraints to a specified CPLEX problem object */
SEXP addRows(SEXP env, SEXP lp, SEXP ncols, SEXP nrows, SEXP nnz,
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

    checkEnv(env);
    checkProb(lp);

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

    status = CPXaddrows(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                        Rf_asInteger(ncols), Rf_asInteger(nrows),
                        Rf_asInteger(nnz),
                        rrhs, rsense, rmatbeg, rmatind, rmatval,
                        (char **) rcnames, (char **) rrnames
                       );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    if (cnames != R_NilValue) {
        R_Free(rcnames);
    }
    if (rnames != R_NilValue) {
        R_Free(rrnames);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get the number of rows in the constraint matrix */
SEXP getNumRows(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    int nrows = 0;

    checkEnv(env);
    checkProb(lp);

    nrows = CPXgetnumrows(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(nrows);

    return out;
}


/* -------------------------------------------------------------------------- */
/* delete a range of rows */
SEXP delRows(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXdelrows(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                        Rf_asInteger(begin), Rf_asInteger(end)
                       );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* delete a set of rows */
SEXP delSetRows(SEXP env, SEXP lp, SEXP delstat) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXdelsetrows(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                           INTEGER(delstat)
                          );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }
    else {
        out = delstat;
    }
    return out;
}


/* -------------------------------------------------------------------------- */
/* add new empty columns to a problem object */
SEXP newCols(SEXP env, SEXP lp,
             SEXP ncols, SEXP obj, SEXP lb, SEXP ub, SEXP xctype, SEXP cnames) {

    SEXP out = R_NilValue;

    int k, nnames;
    const double *robj;
    const double *rlb;
    const double *rub;
    const char *rxctype;
    const char **rcnames;

    checkEnv(env);
    checkProb(lp);

    if (obj == R_NilValue) {
        robj = NULL;
    }
    else {
        robj = REAL(obj);
    }

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

    if (xctype == R_NilValue) {
        rxctype = NULL;
    }
    else {
        rxctype = CHAR(STRING_ELT(xctype, 0));
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

    status = CPXnewcols(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                        Rf_asInteger(ncols), robj, rlb, rub, rxctype,
                        (char **) rcnames
                       );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    if (cnames != R_NilValue) {
        R_Free(rcnames);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* add columns to a specified CPLEX problem object */
SEXP addCols(SEXP env, SEXP lp, SEXP ncols, SEXP nnz, SEXP objf,
             SEXP matbeg, SEXP matind, SEXP matval,
             SEXP lb, SEXP ub, SEXP cnames
            ) {

    SEXP out = R_NilValue;

    int k, nnames;
    const double *robjf   = REAL(objf);
    const int *rmatbeg    = INTEGER(matbeg);
    const int *rmatind    = INTEGER(matind);
    const double *rmatval = REAL(matval);
    const double *rlb, *rub;
    const char **rcnames;

    checkEnv(env);
    checkProb(lp);

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

    status = CPXaddcols(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                        Rf_asInteger(ncols), Rf_asInteger(nnz),
                        robjf, rmatbeg, rmatind, rmatval,
                        rlb, rub, (char **) rcnames
                       );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    if (cnames != R_NilValue) {
        R_Free(rcnames);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get the number of columns in the constraint matrix */
SEXP getNumCols(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    int ncols = 0;

    checkEnv(env);
    checkProb(lp);

    ncols = CPXgetnumcols(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(ncols);

    return out;
}


/* -------------------------------------------------------------------------- */
/* delete a range of columns */
SEXP delCols(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXdelcols(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                        Rf_asInteger(begin), Rf_asInteger(end)
                       );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* deletes a set of columns from a problem object */
SEXP delSetCols(SEXP env, SEXP lp, SEXP delstat) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXdelsetcols(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                           INTEGER(delstat)
                           );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }
    else {
        out = delstat;
    }
    return out;
}


/* -------------------------------------------------------------------------- */
/* change the linear objective coefficients */
SEXP chgObj(SEXP env, SEXP lp, SEXP ncols, SEXP ind, SEXP val) {

    SEXP out = R_NilValue;

    int *rind = INTEGER(ind);
    double *rval = REAL(val);

    checkEnv(env);
    checkProb(lp);

    status = CPXchgobj(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                       Rf_asInteger(ncols), rind, rval
                      );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get the linear objective coefficients */
SEXP getObj(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;
    SEXP obj = R_NilValue;

    int lgobj = 0;

    checkEnv(env);
    checkProb(lp);

    lgobj = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgobj > 0) {

        PROTECT(obj = Rf_allocVector(REALSXP, lgobj));

        status = CPXgetobj(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                           REAL(obj), Rf_asInteger(begin), Rf_asInteger(end)
                          );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = obj;
        }

        UNPROTECT(1);

    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* copy a name for the objective function into a problem object */
SEXP copyObjName(SEXP env, SEXP lp, SEXP oname) {

    SEXP out = R_NilValue;

    const char *roname = CHAR(STRING_ELT(oname, 0));

    checkEnv(env);
    checkProb(lp);

    status = CPXcopyobjname(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                            roname
                           );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access the name of the objective row of a problem object */
SEXP getObjName(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    int ret, sp;
    int osp = 0;
    char *namesp = NULL;

    checkEnv(env);
    checkProb(lp);

    ret = CPXgetobjname(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                        NULL, 0, &sp
                       );

    if (ret == CPXERR_NEGATIVE_SURPLUS) {
        osp -= sp;
        namesp = R_Calloc(osp, char);

        status = CPXgetobjname(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                               namesp, osp, &sp
                              );

        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = Rf_mkString(namesp);
        }
        R_Free(namesp);
    }
    else {
        if (ret != 0) {
            status_message(R_ExternalPtrAddr(env), ret);
            out = cpx_error(ret);
        }
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* change a list of matrix coefficients */
SEXP chgCoefList(SEXP env, SEXP lp, SEXP nnz, SEXP ia, SEXP ja, SEXP ra) {

    SEXP out = R_NilValue;

    const int *ria = INTEGER(ia);
    const int *rja = INTEGER(ja);
    const double *rra = REAL(ra);

    checkEnv(env);
    checkProb(lp);

    status = CPXchgcoeflist(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                            Rf_asInteger(nnz), ria, rja, rra
                           );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* change a single coefficient in the constraint matrix */
SEXP chgCoef(SEXP env, SEXP lp, SEXP i, SEXP j, SEXP val) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXchgcoef(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                        Rf_asInteger(i), Rf_asInteger(j), Rf_asReal(val)
                       );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* change a single coefficient in the quadratic objective of a quadratic
   problem */
SEXP chgQPcoef(SEXP env, SEXP lp, SEXP i, SEXP j, SEXP val) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXchgqpcoef(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          Rf_asInteger(i), Rf_asInteger(j), Rf_asReal(val)
                         );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* change a single coefficient in the constraint matrix */
SEXP getCoef(SEXP env, SEXP lp, SEXP i, SEXP j) {

    SEXP out = R_NilValue;

    double coef = 0;

    checkEnv(env);
    checkProb(lp);

    status = CPXgetcoef(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                        Rf_asInteger(i), Rf_asInteger(j), &coef
                        );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarReal(coef);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* get the number of non zero elements in the constraint matrix */
SEXP getNumNnz(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    int nnz = 0;

    checkEnv(env);
    checkProb(lp);

    nnz = CPXgetnumnz(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(nnz);

    return out;
}


/* -------------------------------------------------------------------------- */
/* change the upper or lower bounds on a set of variables of a problem */
SEXP chgBnds(SEXP env, SEXP lp, SEXP ncols, SEXP ind, SEXP lu, SEXP bd) {

    SEXP out = R_NilValue;

    const int *rind   = INTEGER(ind);
    const char *rlu   = CHAR(STRING_ELT(lu, 0));
    const double *rbd = REAL(bd);

    checkEnv(env);
    checkProb(lp);

    status = CPXchgbds(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                       Rf_asInteger(ncols), rind, rlu, rbd
                      );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* change the upper and lower bounds on a set of variables of a problem */
SEXP chgColsBnds(SEXP env, SEXP lp, SEXP j, SEXP lb, SEXP ub) {

    SEXP out   = R_NilValue;

    int *rj = INTEGER(j);
    double *rlb = REAL(lb), *rub = REAL(ub);

    int k, nj, nChg, nVar;

    int *eq = 0;
    int *pj = 0;
    double *pbnds = 0;
    char *ptype = NULL;

    checkEnv(env);
    checkProb(lp);

    /* PrintValue(j); */

    nj   = Rf_length(j);                /* number of variables */
    nVar = nj;                          /* number of changes */
    eq   = R_Calloc(nj, int);           /* boolean: fixed variable yes|no */

    /* Rprintf("%i\n", nj); */

    for (k = 0; k < nj; k++) {
        if (islessgreater(rlb[k], rub[k])) {
            nVar++;
            eq[k] = 0;
        }
        else {
            eq[k] = 1;
        }
    }

    nChg = nVar;                        /* number of changes */
    /* Rprintf("nj: %i\n", nj); */
    /* Rprintf("nVar: %i\n", nVar); */

    pj    = R_Calloc(nVar, int);        /* prepare arrays for the */
    pbnds = R_Calloc(nVar, double);     /* call to CPXchgbds() */
    ptype = R_Calloc(nVar+1, char);
    ptype[nVar] = '\0';

    /* int dingsbums = strlen(ptype); */
    /* Rprintf("L: %i\n", dingsbums); */

    /* Rprintf("protect\n"); */

    for (k = 0; k < nj; k++) {
        if (eq[k] == 0) {               /* if a variable has upper and */
            nVar--;                     /* lower bound, put the upper */
            pj[k]       = rj[k];        /* bound at the end of the array */
            pj[nVar]    = rj[k];
            pbnds[k]    = rlb[k];
            pbnds[nVar] = rub[k];
            ptype[k]    = 'L';
            ptype[nVar] = 'U';
        }
        else {
            /* Rprintf("eq %i\n", k); */
            pj[k]    = rj[k];
            pbnds[k] = rlb[k];
            ptype[k] = 'B';
        }
    }

    /*
    Rprintf("nVar: %i\n", nVar);
    for (k=0;k<nChg;k++) {
        Rprintf("pj: %i   ", pj[k]);
        Rprintf("ptype: %c   ", ptype[k]);
        Rprintf("pbnds: %f\n", pbnds[k]);
    }
    Rprintf("\n");
    Rprintf("done\n");
    */

    status = CPXchgbds(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                       nChg, pj, ptype, pbnds);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    R_Free(eq);
    R_Free(pj);
    R_Free(pbnds);
    R_Free(ptype);

    /* Rprintf("cplex\n\n\n"); */

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* change the upper or lower bounds on a set of variables of a problem */
SEXP tightenBnds(SEXP env, SEXP lp, SEXP ncols, SEXP ind, SEXP lu, SEXP bd) {

    SEXP out = R_NilValue;

    int *rind = INTEGER(ind);
    const char *rlu = CHAR(STRING_ELT(lu, 0));
    double *rbd = REAL(bd);

    checkEnv(env);
    checkProb(lp);

    status = CPXtightenbds(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                           Rf_asInteger(ncols), rind, rlu, rbd
                          );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* change type of column (variable) */
SEXP chgColType(SEXP env, SEXP lp, SEXP ncols, SEXP ind, SEXP xctype) {

    SEXP out = R_NilValue;

    int *rind = INTEGER(ind);
    const char *rxctype = CHAR(STRING_ELT(xctype, 0));

    checkEnv(env);
    checkProb(lp);

    status = CPXchgctype(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                         Rf_asInteger(ncols), rind, rxctype
                        );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get the types for a range of variables in a problem object */
SEXP getColType(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;

    int lgxctype;
    char *xctype = NULL;

    checkEnv(env);
    checkProb(lp);

    lgxctype = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgxctype > 0) {

        xctype = CallocCharBuf(lgxctype);
        /*
        xctype = R_Calloc(lgxctype+1, char);
        xctype[lgxctype] = '\0';
        */

        status = CPXgetctype(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                             xctype, Rf_asInteger(begin), Rf_asInteger(end)
                            );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = Rf_mkString(xctype);
        }

        R_Free(xctype);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* can be used to copy variable type information into a given problem */
SEXP copyColType(SEXP env, SEXP lp, SEXP xctype) {

    SEXP out = R_NilValue;

    const char *rxctype = CHAR(STRING_ELT(xctype, 0));

    checkEnv(env);
    checkProb(lp);

    status = CPXcopyctype(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                         rxctype
                        );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get a range of lower bounds */
SEXP getLowerBnds(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;
    SEXP lb = R_NilValue;

    int lglb = 0;

    checkEnv(env);
    checkProb(lp);

    lglb = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lglb > 0) {

        PROTECT(lb = Rf_allocVector(REALSXP, lglb));

        status = CPXgetlb(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          REAL(lb), Rf_asInteger(begin), Rf_asInteger(end)
                         );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = lb;
        }

        UNPROTECT(1);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* get a range of upper bounds */
SEXP getUpperBnds(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;
    SEXP ub = R_NilValue;

    int lgub = 0;

    checkEnv(env);
    checkProb(lp);

    lgub = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgub > 0) {

        PROTECT(ub = Rf_allocVector(REALSXP, lgub));

        status = CPXgetub(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          REAL(ub), Rf_asInteger(begin), Rf_asInteger(end)
                         );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = ub;
        }

        UNPROTECT(1);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* get lower bounds of columns (variables) */
SEXP getLowBndsIds(SEXP env, SEXP lp, SEXP ind, SEXP ncols) {

    SEXP out = R_NilValue;
    SEXP olb = R_NilValue;

    int k = 0;
    double lb[1];
    int nc = Rf_asInteger(ncols);
    int *rind = INTEGER(ind);

    int check = 0;

    checkEnv(env);
    checkProb(lp);

    PROTECT(olb = Rf_allocVector(REALSXP, nc));

    while ( (k < nc) && (check == 0) ) {
    /* for (k = 0; k < nc; k++) { */
        status = CPXgetlb(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          lb, rind[k], rind[k]
                         );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
            check = 1;
        }
        else {
            REAL(olb)[k++] = lb[0];
        }
    }

    if (out == R_NilValue) {
        out = olb;
    }

    UNPROTECT(1);


    return out;
}


/* -------------------------------------------------------------------------- */
/* get upper bounds of columns (variables) */
SEXP getUppBndsIds(SEXP env, SEXP lp, SEXP ind, SEXP ncols) {

    SEXP out = R_NilValue;
    SEXP oub = R_NilValue;

    int k = 0;
    double ub[1];
    int nc = Rf_asInteger(ncols);
    int *rind = INTEGER(ind);

    int check = 0;

    checkEnv(env);
    checkProb(lp);

    PROTECT(oub = Rf_allocVector(REALSXP, nc));

    while ( (k < nc) && (check == 0) ) {
    /* for (k = 0; k < nc; k++) { */
        status = CPXgetub(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          ub, rind[k], rind[k]
                         );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
            check = 1;
        }
        else {
            REAL(oub)[k++] = ub[0];
        }
    }

    if (out == R_NilValue) {
        out = oub;
    }

    UNPROTECT(1);

    return out;
}


/* -------------------------------------------------------------------------- */
/* change the right hand side coefficients of a set of linear constraints */
SEXP chgRhs(SEXP env, SEXP lp, SEXP nrows, SEXP ind, SEXP val) {

    SEXP out = R_NilValue;

    int *rind = INTEGER(ind);
    double *rval = REAL(val);

    checkEnv(env);
    checkProb(lp);

    status = CPXchgrhs(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                       Rf_asInteger(nrows), rind, rval
                      );

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get right hand side */
SEXP getRhs(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;
    SEXP rhs = R_NilValue;

    int lgrhs;

    checkEnv(env);
    checkProb(lp);

    lgrhs = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgrhs > 0) {

        PROTECT(rhs = Rf_allocVector(REALSXP, lgrhs));

        status = CPXgetrhs(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                           REAL(rhs), Rf_asInteger(begin), Rf_asInteger(end)
                          );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = rhs;
        }

        UNPROTECT(1);

    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* change the sense of a set of linear constraints */
SEXP chgSense(SEXP env, SEXP lp, SEXP nrows, SEXP ind, SEXP sense) {

    SEXP out = R_NilValue;

    int *rind = INTEGER(ind);
    const char *rsense = CHAR(STRING_ELT(sense, 0));

    checkEnv(env);
    checkProb(lp);

    status = CPXchgsense(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                         Rf_asInteger(nrows), rind, rsense
                        );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get the sense of a set of linear constraints */
SEXP getSense(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;

    int lgsense;
    char *sense = NULL;

    checkEnv(env);
    checkProb(lp);

    lgsense = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgsense > 0) {

        sense = CallocCharBuf(lgsense);
        /*
        sense = R_Calloc(lgsense+1, char);
        sense[lgsense] = '\0';
        */
        status = CPXgetsense(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                             sense, Rf_asInteger(begin), Rf_asInteger(end)
                            );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = Rf_mkString(sense);
        }

        R_Free(sense);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* remove all names that have been previously assigned to rows and columns */
SEXP delNames(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXdelnames(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* change the name of the current problem */
SEXP chgProbName(SEXP env, SEXP lp, SEXP probname) {

    SEXP out = R_NilValue;

    const char *rprobname = CHAR(STRING_ELT(probname, 0));

    checkEnv(env);
    checkProb(lp);

    status = CPXchgprobname(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                            rprobname
                           );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* accesses the name of the problem */
SEXP getProbName(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    int ret, sp;
    int bsp = 0;
    char *namesp = NULL;

    checkEnv(env);
    checkProb(lp);

    ret = CPXgetprobname(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                         NULL, 0, &sp
                        );

    if (ret == CPXERR_NEGATIVE_SURPLUS) {
        bsp -= sp;
        namesp = R_Calloc(bsp, char);

        status = CPXgetprobname(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                namesp, bsp, &sp
                               );

        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = Rf_mkString(namesp);
        }
        R_Free(namesp);
    }
    else {
        if (ret != 0) {
            status_message(R_ExternalPtrAddr(env), ret);
            out = cpx_error(ret);
        }
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* change the name of a constraint or the name of a variable in a
   problem object */
SEXP chgName(SEXP env, SEXP lp, SEXP key, SEXP ij, SEXP name) {

    SEXP out = R_NilValue;

    const char *rkey = CHAR(STRING_ELT(key, 0));
    const char *rname = CHAR(STRING_ELT(name, 0));

    checkEnv(env);
    checkProb(lp);

    status = CPXchgname(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                         rkey[0], Rf_asInteger(ij), rname
                        );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* change the names of linear constraints in a problem object */
SEXP chgRowName(SEXP env, SEXP lp, SEXP nnames, SEXP ind, SEXP names) {

    SEXP out = R_NilValue;

    int k, numn;
    const int *rind = INTEGER(ind);
    const char **rnames;
    /* char **rnames = (char **) CHAR(names); */

    checkEnv(env);
    checkProb(lp);

    numn = Rf_length(names);
    rnames = R_Calloc(numn, const char *);
    for (k = 0; k < numn; k++) {
        rnames[k] = CHAR(STRING_ELT(names, k));
    }

    status = CPXchgrowname(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                           Rf_asInteger(nnames), rind, (char **) rnames
                          );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);
    R_Free(rnames);

    return out;

}


/* -------------------------------------------------------------------------- */
/* change the names of variables in a problem object */
SEXP chgColName(SEXP env, SEXP lp, SEXP nnames, SEXP ind, SEXP names) {

    SEXP out = R_NilValue;

    int k, numn;
    const int *rind = INTEGER(ind);
    const char **rnames;

    checkEnv(env);
    checkProb(lp);

    numn = Rf_length(names);
    rnames = R_Calloc(numn, const char *);
    for (k = 0; k < numn; k++) {
        rnames[k] = CHAR(STRING_ELT(names, k));
    }

    status = CPXchgcolname(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                           Rf_asInteger(nnames), rind, (char **) rnames
                           );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);
    R_Free(rnames);

    return out;

}


/* -------------------------------------------------------------------------- */
/* access a range of row names or, equivalently, the constraint names of a
   problem object */
SEXP getRowName(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;

    int ret, sp, k;
    int lgname = 0;
    int stsp = 0;
    char **name = NULL;
    char *namesp = NULL;

    checkEnv(env);
    checkProb(lp);

    lgname = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgname > 0) {

        ret = CPXgetrowname(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                            NULL, NULL, 0, &sp,
                            Rf_asInteger(begin), Rf_asInteger(end)
                           );

        if (ret == CPXERR_NEGATIVE_SURPLUS) {
            stsp  -= sp;
            name   = R_Calloc(lgname, char *);
            namesp = R_Calloc(stsp, char);
            status = CPXgetrowname(R_ExternalPtrAddr(env),
                                   R_ExternalPtrAddr(lp),
                                   name, namesp, stsp, &sp,
                                   Rf_asInteger(begin), Rf_asInteger(end)
                                  );
            if (status != 0) {
                status_message(R_ExternalPtrAddr(env), status);
                out = cpx_error(status);
            }
            else {
                PROTECT(out = Rf_allocVector(STRSXP, lgname));
                for (k = 0; k < lgname; k++) {
                    SET_STRING_ELT(out, k, Rf_mkChar(name[k]));
                }
                UNPROTECT(1);
            }
            R_Free(name);
            R_Free(namesp);
        }
        else {
            if (ret != 0) {
                status_message(R_ExternalPtrAddr(env), ret);
                out = cpx_error(ret);
            }
        }
    }

    return out;

}


/* -------------------------------------------------------------------------- */
/* access a range of column names or, equivalently, the variable names of a
   problem object */
SEXP getColName(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;

    int ret, sp, k;
    int lgname = 0;
    int stsp = 0;
    char **name = NULL;
    char *namesp = NULL;

    checkEnv(env);
    checkProb(lp);

    lgname = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgname > 0) {

        ret = CPXgetcolname(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                            NULL, NULL, 0, &sp,
                            Rf_asInteger(begin), Rf_asInteger(end)
                            );

        if (ret == CPXERR_NEGATIVE_SURPLUS) {
            stsp  -= sp;
            name   = R_Calloc(lgname, char *);
            namesp = R_Calloc(stsp, char);
            status = CPXgetcolname(R_ExternalPtrAddr(env),
                                   R_ExternalPtrAddr(lp),
                                   name, namesp, stsp, &sp,
                                   Rf_asInteger(begin), Rf_asInteger(end)
                                   );
            if (status != 0) {
                status_message(R_ExternalPtrAddr(env), status);
                out = cpx_error(status);
            }
            else {
                PROTECT(out = Rf_allocVector(STRSXP, lgname));
                for (k = 0; k < lgname; k++) {
                    SET_STRING_ELT(out, k, Rf_mkChar(name[k]));
                }
                UNPROTECT(1);
            }
            R_Free(name);
            R_Free(namesp);
        }
        else {
            if (ret != 0) {
                status_message(R_ExternalPtrAddr(env), ret);
                out = cpx_error(ret);
            }
        }
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* search for the index number of the specified column in a problem object */
SEXP getColIndex(SEXP env, SEXP lp, SEXP cname) {

    SEXP out = R_NilValue;

    const char *rcname = CHAR(STRING_ELT(cname, 0));

    int cindex = -1;

    checkEnv(env);
    checkProb(lp);

    status = CPXgetcolindex(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                            rcname, &cindex
                           );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarInteger(cindex);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* search for the index number of the specified row in a problem object */
SEXP getRowIndex(SEXP env, SEXP lp, SEXP rname) {

    SEXP out = R_NilValue;

    const char *rrname = CHAR(STRING_ELT(rname, 0));

    int rindex = -1;

    checkEnv(env);
    checkProb(lp);

    status = CPXgetrowindex(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                            rrname, &rindex
                            );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarInteger(rindex);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* change the right hand side coefficients of a set of linear constraints */
SEXP chgRngVal(SEXP env, SEXP lp, SEXP nrows, SEXP ind, SEXP val) {

    SEXP out = R_NilValue;

    int *rind = INTEGER(ind);
    double *rval = REAL(val);

    checkEnv(env);
    checkProb(lp);

    status = CPXchgrngval(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          Rf_asInteger(nrows), rind, rval
                         );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get rhs range coefficients for a set of constraints */
SEXP getRngVal(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;
    SEXP rngval = R_NilValue;

    int lgrngval = 0;

    checkEnv(env);
    checkProb(lp);

    lgrngval = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgrngval > 0) {

        PROTECT(rngval = Rf_allocVector(REALSXP, lgrngval));

        status = CPXgetrngval(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                              REAL(rngval),
                              Rf_asInteger(begin), Rf_asInteger(end)
                             );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = rngval;
        }

        UNPROTECT(1);

    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* access a range of rows of the constraint matrix, not including the objective
   function nor the bound constraints on the variables of a problem object */
SEXP getRows(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out    = R_NilValue;
    SEXP listn  = R_NilValue;
    SEXP matbeg = R_NilValue;
    SEXP matind = R_NilValue;
    SEXP matval = R_NilValue;

    int ret, sp;
    int matsp  = 0;
    int nnz    = 0;
    int lgrows = 0;

    checkEnv(env);
    checkProb(lp);

    lgrows = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgrows > 0) {

        PROTECT(matbeg = Rf_allocVector(INTSXP, lgrows));

        ret = CPXgetrows(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                         &nnz, INTEGER(matbeg), NULL, NULL, 0, &sp,
                         Rf_asInteger(begin), Rf_asInteger(end)
                        );

        if (ret == CPXERR_NEGATIVE_SURPLUS) {
            matsp -= sp;
            PROTECT(matind = Rf_allocVector(INTSXP, matsp));
            PROTECT(matval = Rf_allocVector(REALSXP, matsp));
            status = CPXgetrows(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                &nnz, INTEGER(matbeg), INTEGER(matind),
                                REAL(matval), matsp, &sp,
                                Rf_asInteger(begin), Rf_asInteger(end)
                               );

            if (status != 0) {
                status_message(R_ExternalPtrAddr(env), status);
                out = cpx_error(status);
            }
            else {
                PROTECT(out = Rf_allocVector(VECSXP, 3));
                SET_VECTOR_ELT(out, 0, matbeg);
                SET_VECTOR_ELT(out, 1, matind);
                SET_VECTOR_ELT(out, 2, matval);

                PROTECT(listn = Rf_allocVector(STRSXP, 3));
                SET_STRING_ELT(listn, 0, Rf_mkChar("matbeg"));
                SET_STRING_ELT(listn, 1, Rf_mkChar("matind"));
                SET_STRING_ELT(listn, 2, Rf_mkChar("matval"));
                Rf_setAttrib(out, R_NamesSymbol, listn);

                UNPROTECT(2);
            }
            UNPROTECT(2);
        }
        else {
            if (ret != 0) {
                status_message(R_ExternalPtrAddr(env), ret);
                out = cpx_error(ret);
            }
        }

        UNPROTECT(1);

    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* access a range of columns of the constraint matrix of a problem object */
SEXP getCols(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out    = R_NilValue;
    SEXP listn  = R_NilValue;
    SEXP matbeg = R_NilValue;
    SEXP matind = R_NilValue;
    SEXP matval = R_NilValue;

    int ret, sp;
    int matsp  = 0;
    int nnz    = 0;
    int lgcols = 0;

    checkEnv(env);
    checkProb(lp);

    lgcols = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgcols > 0) {

        PROTECT(matbeg = Rf_allocVector(INTSXP, lgcols));

        ret = CPXgetcols(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                         &nnz, INTEGER(matbeg), NULL, NULL, 0, &sp,
                         Rf_asInteger(begin), Rf_asInteger(end)
                         );

        if (ret == CPXERR_NEGATIVE_SURPLUS) {
            matsp -= sp;
            PROTECT(matind = Rf_allocVector(INTSXP, matsp));
            PROTECT(matval = Rf_allocVector(REALSXP, matsp));
            status = CPXgetcols(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                &nnz, INTEGER(matbeg), INTEGER(matind),
                                REAL(matval), matsp, &sp,
                                Rf_asInteger(begin), Rf_asInteger(end)
                                );

            if (status != 0) {
                status_message(R_ExternalPtrAddr(env), status);
                out = cpx_error(status);
            }
            else {
                PROTECT(out = Rf_allocVector(VECSXP, 3));
                SET_VECTOR_ELT(out, 0, matbeg);
                SET_VECTOR_ELT(out, 1, matind);
                SET_VECTOR_ELT(out, 2, matval);

                PROTECT(listn = Rf_allocVector(STRSXP, 3));
                SET_STRING_ELT(listn, 0, Rf_mkChar("matbeg"));
                SET_STRING_ELT(listn, 1, Rf_mkChar("matind"));
                SET_STRING_ELT(listn, 2, Rf_mkChar("matval"));
                Rf_setAttrib(out, R_NamesSymbol, listn);

                UNPROTECT(2);
            }
            UNPROTECT(2);
        }
        else {
            if (ret != 0) {
                status_message(R_ExternalPtrAddr(env), ret);
                out = cpx_error(ret);
            }
        }

        UNPROTECT(1);

    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* manage modification steps closely */
SEXP completelp(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXcompletelp(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* change to zero any problem coefficients that are smaller in magnitude than
   the tolerance specified in the argument eps */
SEXP cleanupCoef(SEXP env, SEXP lp, SEXP eps) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXcleanup(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                        Rf_asReal(eps)
                       );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* provide starting information for use in a subsequent call
   to a simplex optimization routine  */
SEXP copyStart(SEXP env, SEXP lp,
               SEXP cstat, SEXP rstat,
               SEXP cprim, SEXP rprim,
               SEXP cdual, SEXP rdual) {

    SEXP out = R_NilValue;

    int *rcstat;
    int *rrstat;
    double *rcprim;
    double *rrprim;
    double *rcdual;
    double *rrdual;

    checkEnv(env);
    checkProb(lp);

    if (cstat == R_NilValue) {
        rcstat = NULL;
    }
    else {
        rcstat = INTEGER(cstat);
    }

    if (rstat == R_NilValue) {
        rrstat = NULL;
    }
    else {
        rrstat = INTEGER(rstat);
    }

    if (cprim == R_NilValue) {
        rcprim = NULL;
    }
    else {
        rcprim = REAL(cprim);
    }

    if (rprim == R_NilValue) {
        rrprim = NULL;
    }
    else {
        rrprim = REAL(rprim);
    }

    if (cdual == R_NilValue) {
        rcdual = NULL;
    }
    else {
        rcdual = REAL(cdual);
    }

    if (rdual == R_NilValue) {
        rrdual = NULL;
    }
    else {
        rrdual = REAL(rdual);
    }

    status = CPXcopystart(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          rcstat, rrstat, rcprim, rrprim, rcdual, rrdual
                         );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* copy a basis into a problem object */
SEXP copyBase(SEXP env, SEXP lp, SEXP cstat, SEXP rstat) {

    SEXP out = R_NilValue;

    int *rcstat = INTEGER(cstat);
    int *rrstat = INTEGER(rstat);

    checkEnv(env);
    checkProb(lp);

    status = CPXcopybase(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                         rcstat, rrstat
                        );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* copy a partial basis into an LP problem object */
SEXP copyPartBase(SEXP env, SEXP lp,
                  SEXP ncind, SEXP cind, SEXP cstat,
                  SEXP nrind, SEXP rind, SEXP rstat) {

    SEXP out = R_NilValue;

    int *rcind  = INTEGER(cind);
    int *rrind  = INTEGER(rind);
    int *rcstat = INTEGER(cstat);
    int *rrstat = INTEGER(rstat);

    checkEnv(env);
    checkProb(lp);

    status = CPXcopypartialbase(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                Rf_asInteger(ncind), rcind, rcstat,
                                Rf_asInteger(nrind), rrind, rrstat
                               );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access the basis resident in a problem object */
SEXP getBase(SEXP env, SEXP lp) {

    SEXP out   = R_NilValue;
    SEXP listn = R_NilValue;
    SEXP cstat = R_NilValue;
    SEXP rstat = R_NilValue;

    int nc, nr;

    checkEnv(env);
    checkProb(lp);

    nc = CPXgetnumcols(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    nr = CPXgetnumrows(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    PROTECT(cstat = Rf_allocVector(INTSXP, nc));
    PROTECT(rstat = Rf_allocVector(INTSXP, nr));

    status = CPXgetbase(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                        INTEGER(cstat), INTEGER(rstat));
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        PROTECT(out = Rf_allocVector(VECSXP, 2));
        SET_VECTOR_ELT(out, 0, cstat);
        SET_VECTOR_ELT(out, 1, rstat);

        PROTECT(listn = Rf_allocVector(STRSXP, 2));
        SET_STRING_ELT(listn, 0, Rf_mkChar("cstat"));
        SET_STRING_ELT(listn, 1, Rf_mkChar("rstat"));
        Rf_setAttrib(out, R_NamesSymbol, listn);

        UNPROTECT(2);
    }

    UNPROTECT(2);

    return out;
}


/* -------------------------------------------------------------------------- */
/* write the most current basis associated with a problem object to file */
SEXP baseWrite(SEXP env, SEXP lp, SEXP fname) {

    SEXP out = R_NilValue;

    const char *rfname = CHAR(STRING_ELT(fname, 0));

    checkEnv(env);
    checkProb(lp);

    status = CPXmbasewrite(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                           rfname
                          );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* read a basis from a BAS file, and copy that basis into a problem object */
SEXP readCopyBase(SEXP env, SEXP lp, SEXP fname) {

    SEXP out = R_NilValue;

    const char *rfname = CHAR(STRING_ELT(fname, 0));

    checkEnv(env);
    checkProb(lp);

    status = CPXreadcopybase(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                             rfname
                            );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* solve lp problem (general, use CPX_PARAM_LPMETHOD) */
SEXP lpopt(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXlpopt(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* solve lp problem using primal simplex method */
SEXP primopt(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXprimopt(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* solve lp problem using dual simplex method */
SEXP dualopt(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXdualopt(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* solve lp problem using baropt */
SEXP baropt(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXbaropt(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* solve lp problem using hybbaropt */
SEXP hybbaropt(SEXP env, SEXP lp, SEXP method) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXhybbaropt(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          Rf_asInteger(method)
                         );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* solve lp problem using hybnetopt */
SEXP hybnetopt(SEXP env, SEXP lp, SEXP method) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXhybnetopt(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          Rf_asInteger(method)
                         );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* solve lp problem using siftopt */
SEXP siftopt(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXsiftopt(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* solve lp problem using mipopt */
SEXP mipopt(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXmipopt(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* solve qp problem using qpopt */
SEXP qpopt(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXqpopt(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access the MIP cutoff value being used during mixed integer optimization */
SEXP getCutoff(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    double coff;

    checkEnv(env);
    checkProb(lp);

    status = CPXgetcutoff(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp), &coff);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarReal(coff);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* provide two arrays that can be used to project the impact of making changes
   to optimal variable values or objective function coefficients */
SEXP getGrad(SEXP env, SEXP lp, SEXP j) {

    SEXP out   = R_NilValue;
    SEXP listn = R_NilValue;
    SEXP head  = R_NilValue;
    SEXP y     = R_NilValue;

    int nr = 0;

    checkEnv(env);
    checkProb(lp);

    nr = CPXgetnumrows(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    PROTECT(head = Rf_allocVector(INTSXP,  nr));
    PROTECT(y    = Rf_allocVector(REALSXP, nr));

    status = CPXgetgrad(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                        Rf_asInteger(j), INTEGER(head), REAL(y)
                       );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        PROTECT(out = Rf_allocVector(VECSXP, 2));
        SET_VECTOR_ELT(out, 0, head);
        SET_VECTOR_ELT(out, 1, y);

        PROTECT(listn = Rf_allocVector(STRSXP, 2));
        SET_STRING_ELT(listn, 0, Rf_mkChar("head"));
        SET_STRING_ELT(listn, 1, Rf_mkChar("y"));

        Rf_setAttrib(out, R_NamesSymbol, listn);

        UNPROTECT(2);
    }
    UNPROTECT(2);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access the total number of simplex iterations to solve an LP problem, or
   the number of crossover iterations in the case that the barrier optimizer
   is used */
SEXP getItCnt(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    int itcnt = 0;

    checkEnv(env);
    checkProb(lp);

    itcnt = CPXgetitcnt(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(itcnt);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access the number of Phase I iterations to solve a problem using the
   primal or dual simplex method */
SEXP getPhase1Cnt(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    int pcnt = 0;

    checkEnv(env);
    checkProb(lp);

    pcnt = CPXgetphase1cnt(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(pcnt);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access the total number of sifting iterations to solve an LP problem */
SEXP getSiftItCnt(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    int scnt = 0;

    checkEnv(env);
    checkProb(lp);

    scnt = CPXgetsiftitcnt(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(scnt);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access the number of Phase I sifting iterations to solve an LP problem */
SEXP getSiftPase1Cnt(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    int spcnt = 0;

    checkEnv(env);
    checkProb(lp);

    spcnt = CPXgetsiftphase1cnt(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(spcnt);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access the number of dual super-basic variables in the current solution */
SEXP getDbsCnt(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    int dcnt = 0;

    checkEnv(env);
    checkProb(lp);

    dcnt = CPXgetdsbcnt(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(dcnt);

    return out;
}


/* -------------------------------------------------------------------------- */
/* computes a minimum-cost relaxation of the righthand side values of
   constraints or bounds on variables in order to make an
   infeasible problem feasible */
/*
SEXP feasOpt(SEXP env, SEXP lp, SEXP rhs, SEXP rng, SEXP lb, SEXP ub) {

    SEXP out = R_NilValue;

    double *rrhs;
    double *rrng;
    double *rlb;
    double *rub;

    checkEnv(env);
    checkProb(lp);

    if (rhs == R_NilValue) {
        rrhs = NULL;
    }
    else {
        rrhs = REAL(rhs);
    }

    if (rng == R_NilValue) {
        rrng = NULL;
    }
    else {
        rrng = REAL(rng);
    }

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

    status = CPXfeasopt(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                        rrhs, rrng, rlb, rub
                       );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}
*/

SEXP feasOpt(SEXP env, SEXP lp, SEXP rhs, SEXP rng, SEXP lb, SEXP ub) {

    SEXP out = R_NilValue;

    int nr, nc;

    const double *rrhs;
    const double *rrng;
    const double *rlb;
    const double *rub;

    checkEnv(env);
    checkProb(lp);

    nr = CPXgetnumrows(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    nc = CPXgetnumcols(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    if (Rf_asLogical(rhs) == 0) {
        rrhs = NULL;
    }
    else {
        rrhs = R_Calloc(nr, const double);
    }

    if (Rf_asLogical(rng) == 0) {
        rrng = NULL;
    }
    else {
        rrng = R_Calloc(nr, const double);
    }

    if (Rf_asLogical(lb) == 0) {
        rlb = NULL;
    }
    else {
        rlb = R_Calloc(nc, const double);
    }

    if (Rf_asLogical(ub) == 0) {
        rub = NULL;
    }
    else {
        rub = R_Calloc(nc, const double);
    }

    status = CPXfeasopt(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                        rrhs, rrng, rlb, rub
                       );

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    if (Rf_asLogical(rhs) != 0) {
        R_Free(rrhs);
    }

    if (Rf_asLogical(rng) != 0) {
        R_Free(rrng);
    }

    if (Rf_asLogical(lb) != 0) {
        R_Free(rlb);
    }

    if (Rf_asLogical(ub) != 0) {
        R_Free(rub);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* compute the infeasibility of a given solution for a range of variables */
SEXP getColInfeas(SEXP env, SEXP lp, SEXP sol, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;
    SEXP infout = R_NilValue;

    double *rsol;
    int lginf = 0;

    checkEnv(env);
    checkProb(lp);

    if (sol == R_NilValue) {
        rsol = NULL;
    }
    else {
        rsol = REAL(sol);
    }

    lginf = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lginf > 0) {

        PROTECT(infout = Rf_allocVector(REALSXP, lginf));

        status = CPXgetcolinfeas(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                 rsol, REAL(infout),
                                 Rf_asInteger(begin), Rf_asInteger(end)
                                );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = infout;
        }

        UNPROTECT(1);

    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* compute the infeasibility of a given solution for a range of
   linear constraints */
SEXP getRowInfeas(SEXP env, SEXP lp, SEXP sol, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;
    SEXP infout = R_NilValue;

    double *rsol;
    int lginf = 0;

    checkEnv(env);
    checkProb(lp);

    if (sol == R_NilValue) {
        rsol = NULL;
    }
    else {
        rsol = REAL(sol);
    }

    lginf = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lginf > 0) {

        PROTECT(infout = Rf_allocVector(REALSXP, lginf));

        status = CPXgetrowinfeas(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                 rsol, REAL(infout),
                                 Rf_asInteger(begin), Rf_asInteger(end)
                                 );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = infout;
        }

        UNPROTECT(1);

    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* identify a minimal conflict for the infeasibility of the linear constraints
   and the variable bounds in the current problem */
SEXP refineConflict(SEXP env, SEXP lp) {

    SEXP out   = R_NilValue;
    SEXP listn = R_NilValue;

    int ncr = 0, ncc = 0;

    checkEnv(env);
    checkProb(lp);

    status = CPXrefineconflict(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                               &ncr, &ncc
                              );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        PROTECT(out = Rf_allocVector(VECSXP, 2));
        SET_VECTOR_ELT(out, 0, Rf_ScalarInteger(ncr));
        SET_VECTOR_ELT(out, 1, Rf_ScalarInteger(ncc));

        PROTECT(listn = Rf_allocVector(STRSXP, 2));
        SET_STRING_ELT(listn, 0, Rf_mkChar("confnumrows"));
        SET_STRING_ELT(listn, 1, Rf_mkChar("confnumcols"));

        Rf_setAttrib(out, R_NamesSymbol, listn);

        UNPROTECT(2);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* identify a minimal conflict for the infeasibility of the current problem
   or a subset of constraints of the current problem */
SEXP refineConflictExt(SEXP env, SEXP lp, SEXP grpcnt, SEXP concnt,
                       SEXP grppref, SEXP grpbeg, SEXP grpind,
                       SEXP grptype
                      ) {

    SEXP out = R_NilValue;

    const double *rgrppref = REAL(grppref);
    const int *rgrpbeg     = INTEGER(grpbeg);
    const int *rgrpind     = INTEGER(grpind);
    const char *rgrptype   = CHAR(STRING_ELT(grptype, 0));

    checkEnv(env);
    checkProb(lp);

    status = CPXrefineconflictext(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                  Rf_asInteger(grpcnt), Rf_asInteger(concnt),
                                  rgrppref, rgrpbeg, rgrpind, rgrptype
                                 );

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* return the linear constraints and variables belonging to a conflict
   previously computed by the routine CPXrefineconflict */
SEXP getConflict(SEXP env, SEXP lp) {

    SEXP out   = R_NilValue;
    SEXP listn = R_NilValue;

    SEXP rind    = R_NilValue;
    SEXP rstat   = R_NilValue;

    SEXP cind    = R_NilValue;
    SEXP cstat   = R_NilValue;

    int costat = 0, cnrows = 0, cncols = 0;
    int ret = 0;
    int nr = 0;
    int nc = 0;

    checkEnv(env);
    checkProb(lp);

    /* Calculate the required length of rind, rstat, cind and cstat by calling
       CPXgetconflict a first time with NULL -> nr and nc contain the
       desired values. */

    ret = CPXgetconflict(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                         &costat, NULL, NULL, &nr, NULL, NULL, &nc
                        );

    /*
    nr = CPXgetnumrows(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    nc = CPXgetnumcols(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    */

    /* Rprintf("rows: %i, columns: %i\n", nr, nc); */

    if (ret != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(ret);
    }
    else {
        PROTECT(rind   = Rf_allocVector(INTSXP, nr));
        PROTECT(rstat  = Rf_allocVector(INTSXP, nr));
        PROTECT(cind   = Rf_allocVector(INTSXP, nc));
        PROTECT(cstat  = Rf_allocVector(INTSXP, nc));

        status = CPXgetconflict(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                &costat,
                                INTEGER(rind), INTEGER(rstat), &cnrows,
                                INTEGER(cind), INTEGER(cstat), &cncols
                               );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            PROTECT(out = Rf_allocVector(VECSXP, 7));
            SET_VECTOR_ELT(out, 0, Rf_ScalarInteger(costat));
            SET_VECTOR_ELT(out, 1, Rf_ScalarInteger(cnrows));
            SET_VECTOR_ELT(out, 2, rind);
            SET_VECTOR_ELT(out, 3, rstat);
            SET_VECTOR_ELT(out, 4, Rf_ScalarInteger(cncols));
            SET_VECTOR_ELT(out, 5, cind);
            SET_VECTOR_ELT(out, 6, cstat);

            PROTECT(listn = Rf_allocVector(STRSXP, 7));
            SET_STRING_ELT(listn, 0, Rf_mkChar("confstat"));
            SET_STRING_ELT(listn, 1, Rf_mkChar("confnumrows"));
            SET_STRING_ELT(listn, 2, Rf_mkChar("rowind"));
            SET_STRING_ELT(listn, 3, Rf_mkChar("rowbdstat"));
            SET_STRING_ELT(listn, 4, Rf_mkChar("confnumcols"));
            SET_STRING_ELT(listn, 5, Rf_mkChar("colind"));
            SET_STRING_ELT(listn, 6, Rf_mkChar("colbdstat"));

            Rf_setAttrib(out, R_NamesSymbol, listn);

            UNPROTECT(2);
        }

        UNPROTECT(4);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* get conflict status codes of the groups numbered beg (for begin) through end
   in the most recent call */
SEXP getConflictExt(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out     = R_NilValue;
    SEXP grpstat = R_NilValue;

    int lggs = 0;

    checkEnv(env);
    checkProb(lp);

    lggs = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lggs > 0) {

        PROTECT(grpstat = Rf_allocVector(INTSXP, lggs));

        status = CPXgetconflictext(R_ExternalPtrAddr(env),
                                   R_ExternalPtrAddr(lp), INTEGER(grpstat),
                                   Rf_asInteger(begin), Rf_asInteger(end)
                                  );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = grpstat;
        }

        UNPROTECT(1);
    }
    return out;
}


/* -------------------------------------------------------------------------- */
/* write an LP format file containing the identified conflict */
SEXP cLpWrite(SEXP env, SEXP lp, SEXP fname) {

    SEXP out = R_NilValue;

    const char *rfname = CHAR(STRING_ELT(fname, 0));

    checkEnv(env);
    checkProb(lp);

    status = CPXclpwrite(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp), rfname);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* free the presolved problem from the LP problem object */
SEXP freePresolve(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXfreepresolve(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* return an integer specifying the solution algorithm used to solve the
   resident LP, QP, or QCP problem */
SEXP getMethod(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    int method;

    checkEnv(env);
    checkProb(lp);

    method = CPXgetmethod(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(method);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access the solution method of the last subproblem optimization, in the case
   of an error termination during mixed integer optimization */
SEXP getSubMethod(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    int submethod;

    checkEnv(env);
    checkProb(lp);

    submethod = CPXgetsubmethod(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(submethod);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get double-valued information about the quality of the current
   solution of a problem */
SEXP getDblQual(SEXP env, SEXP lp, SEXP w) {

    SEXP out = R_NilValue;

    double quality;

    checkEnv(env);
    checkProb(lp);

    status = CPXgetdblquality(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                              &quality, Rf_asInteger(w)
                             );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarReal(quality);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* get integer-valued information about the quality of the current
   solution of a problem */
SEXP getIntQual(SEXP env, SEXP lp, SEXP w) {

    SEXP out = R_NilValue;

    int quality;

    checkEnv(env);
    checkProb(lp);

    status = CPXgetintquality(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                              &quality, Rf_asInteger(w)
                             );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarInteger(quality);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* access solution information */
SEXP solnInfo(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    SEXP listn = R_NilValue;

    int met, type, pfeas, dfeas;

    checkEnv(env);
    checkProb(lp);

    status = CPXsolninfo(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                         &met, &type, &pfeas, &dfeas
                        );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        PROTECT(out = Rf_allocVector(VECSXP, 4));
        SET_VECTOR_ELT(out, 0, Rf_ScalarInteger(met));
        SET_VECTOR_ELT(out, 1, Rf_ScalarInteger(type));
        SET_VECTOR_ELT(out, 2, Rf_ScalarInteger(pfeas));
        SET_VECTOR_ELT(out, 3, Rf_ScalarInteger(dfeas));

        PROTECT(listn = Rf_allocVector(STRSXP, 4));
        SET_STRING_ELT(listn, 0, Rf_mkChar("method"));
        SET_STRING_ELT(listn, 1, Rf_mkChar("type"));
        SET_STRING_ELT(listn, 2, Rf_mkChar("primal_feasible"));
        SET_STRING_ELT(listn, 3, Rf_mkChar("dual_feasible"));
        Rf_setAttrib(out, R_NamesSymbol, listn);

        UNPROTECT(2);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* accesses the solution values produced by all the optimization routines
   except the routine CPXNETprimopt */
SEXP solution(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    SEXP listn = R_NilValue;

    SEXP xvar   = R_NilValue;
    SEXP pi     = R_NilValue;
    SEXP slack  = R_NilValue;
    SEXP dj     = R_NilValue;

    int stat = 0;
    double objval;

    int nrows = 0, ncols = 0, ptype = 0;

    int nrch  = 0;   /* number of rows for pi */
    int ncch  = 0;   /* number of columns for dj */

    int tcheck = 0;  /* 1 for QCP or MIP optimizers */
    int rcheck = 0;  /* 1 if nrows is zero */
    int ccheck = 0;  /* 1 if ncols is zero */

    checkEnv(env);
    checkProb(lp);

    nrows = CPXgetnumrows(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    ncols = CPXgetnumcols(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));
    ptype = CPXgetprobtype(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    if (nrows == 0) {
        nrows++;
        rcheck = 1;
    }

    if (ncols == 0) {
        ncols++;
        ccheck = 1;
    }

    if (ptype == CPXPROB_MILP || ptype == CPXPROB_FIXEDMILP ||
        ptype == CPXPROB_QCP  || ptype == CPXPROB_MIQCP) {
        nrch = 1;
        ncch = 1;
        tcheck = 1;
    }
    else {
        nrch = nrows;
        ncch = ncols;
        tcheck = 0;
    }

    PROTECT(xvar   = Rf_allocVector(REALSXP, ncols));
    PROTECT(slack  = Rf_allocVector(REALSXP, nrows));
    PROTECT(pi     = Rf_allocVector(REALSXP, nrch));
    PROTECT(dj     = Rf_allocVector(REALSXP, ncch));

    if (tcheck == 1) {
        REAL(pi)[0] = NA_REAL;
        REAL(dj)[0] = NA_REAL;

        status = CPXsolution(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                             &stat, &objval, REAL(xvar), NULL, REAL(slack), NULL
                            );
    } else {
        status = CPXsolution(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                             &stat, &objval,
                             REAL(xvar), REAL(pi), REAL(slack), REAL(dj)
                            );
    }

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        if (rcheck == 1) {
            REAL(pi)[0]    = NA_REAL;
            REAL(slack)[0] = NA_REAL;
        }
        if (ccheck == 1) {
            REAL(xvar)[0] = NA_REAL;
            REAL(dj)[0]   = NA_REAL;
        }

        PROTECT(out = Rf_allocVector(VECSXP, 6));
        SET_VECTOR_ELT(out, 0, Rf_ScalarInteger(stat));
        SET_VECTOR_ELT(out, 1, Rf_ScalarReal(objval));
        SET_VECTOR_ELT(out, 2, xvar);
        SET_VECTOR_ELT(out, 3, pi);
        SET_VECTOR_ELT(out, 4, slack);
        SET_VECTOR_ELT(out, 5, dj);

        PROTECT(listn = Rf_allocVector(STRSXP, 6));
        SET_STRING_ELT(listn, 0, Rf_mkChar("lpstat"));
        SET_STRING_ELT(listn, 1, Rf_mkChar("objval"));
        SET_STRING_ELT(listn, 2, Rf_mkChar("x"));
        SET_STRING_ELT(listn, 3, Rf_mkChar("pi"));
        SET_STRING_ELT(listn, 4, Rf_mkChar("slack"));
        SET_STRING_ELT(listn, 5, Rf_mkChar("dj"));

        Rf_setAttrib(out, R_NamesSymbol, listn);

        UNPROTECT(2);
    }

    UNPROTECT(4);

    return out;
}


/* -------------------------------------------------------------------------- */
/* write a solution file for the selected problem object */
SEXP solWrite(SEXP env, SEXP lp, SEXP fname) {

    SEXP out = R_NilValue;

    const char *rfname = CHAR(STRING_ELT(fname, 0));

    checkEnv(env);
    checkProb(lp);

    status = CPXsolwrite(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp), rfname);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* read a solution from a SOL format file, and copies that basis or solution
   into a problem object */
SEXP readCopySol(SEXP env, SEXP lp, SEXP fname) {

    SEXP out = R_NilValue;

    const char *rfname = CHAR(STRING_ELT(fname, 0));

    checkEnv(env);
    checkProb(lp);

    status = CPXreadcopysol(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                            rfname
                           );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access solution status of optimizations */
SEXP getStat(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    int solstat = 0;

    checkEnv(env);
    checkProb(lp);

    solstat = CPXgetstat(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(solstat);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access the solution status of the last subproblem optimization, in the case
   of an error termination during mixed integer optimization */
SEXP getSubStat(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    int substat = 0;

    checkEnv(env);
    checkProb(lp);

    substat = CPXgetsubstat(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(substat);

    return out;
}


/* -------------------------------------------------------------------------- */
/* get solution objective value */
SEXP getObjVal(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    double obj;

    checkEnv(env);
    checkProb(lp);

    status = CPXgetobjval(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp), &obj);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarReal(obj);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* access the currently best known bound of all the remaining open nodes
   in a branch-and-cut tree */
SEXP getBestObjVal(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    double obj;

    checkEnv(env);
    checkProb(lp);

    status = CPXgetbestobjval(R_ExternalPtrAddr(env),
                              R_ExternalPtrAddr(lp), &obj);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarReal(obj);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* access the relative objective gap for a MIP optimization */
SEXP getMIPrelGap(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;

    double gap;

    checkEnv(env);
    checkProb(lp);

    status = CPXgetmiprelgap(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                             &gap);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarReal(gap);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* get solution values for a range of problem variables */
SEXP getProbVar(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;
    SEXP xval = R_NilValue;

    int lgx = 0;

    checkEnv(env);
    checkProb(lp);

    lgx = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgx > 0) {

        PROTECT(xval = Rf_allocVector(REALSXP, lgx));

        status = CPXgetx(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                         REAL(xval), Rf_asInteger(begin), Rf_asInteger(end)
                        );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = xval;
        }

        UNPROTECT(1);

    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* get slack values for a range of constraints */
SEXP getSlack(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;
    SEXP slack = R_NilValue;

    int lgslack = 0;

    checkEnv(env);
    checkProb(lp);

    lgslack = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgslack > 0) {

        PROTECT(slack = Rf_allocVector(REALSXP, lgslack));

        status = CPXgetslack(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                             REAL(slack), Rf_asInteger(begin), Rf_asInteger(end)
                            );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = slack;
        }

        UNPROTECT(1);

    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* get dual values for a range of constraints */
SEXP getPi(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;
    SEXP pi  = R_NilValue;

    int lgpi = 0;

    checkEnv(env);
    checkProb(lp);

    lgpi = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgpi > 0) {

        PROTECT(pi = Rf_allocVector(REALSXP, lgpi));

        status = CPXgetpi(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          REAL(pi), Rf_asInteger(begin), Rf_asInteger(end)
                         );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = pi;
        }

        UNPROTECT(1);

    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* access the reduced costs for a range of the variables of a linear
   or quadratic program */
SEXP getDj(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;
    SEXP dj  = R_NilValue;

    int lgdj = 0;

    checkEnv(env);
    checkProb(lp);

    lgdj = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgdj > 0) {

        PROTECT(dj = Rf_allocVector(REALSXP, lgdj));

        status = CPXgetdj(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          REAL(dj), Rf_asInteger(begin), Rf_asInteger(end)
                         );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            out = dj;
        }

        UNPROTECT(1);

    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* access upper and lower sensitivity ranges for lower and upper variable
   bounds for a specified range of variable indices */
SEXP boundSa(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out   = R_NilValue;
    SEXP lbl   = R_NilValue;
    SEXP lbu   = R_NilValue;
    SEXP ubl   = R_NilValue;
    SEXP ubu   = R_NilValue;
    SEXP listn = R_NilValue;

    int lgb = 0;

    checkEnv(env);
    checkProb(lp);

    lgb = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgb > 0) {

        PROTECT(lbl = Rf_allocVector(REALSXP, lgb));
        PROTECT(lbu = Rf_allocVector(REALSXP, lgb));
        PROTECT(ubl = Rf_allocVector(REALSXP, lgb));
        PROTECT(ubu = Rf_allocVector(REALSXP, lgb));

        status = CPXboundsa(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                            Rf_asInteger(begin), Rf_asInteger(end),
                            REAL(lbl), REAL(lbu), REAL(ubl), REAL(ubu)
                           );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            PROTECT(out = Rf_allocVector(VECSXP, 4));
            SET_VECTOR_ELT(out, 0, lbl);
            SET_VECTOR_ELT(out, 1, lbu);
            SET_VECTOR_ELT(out, 2, ubl);
            SET_VECTOR_ELT(out, 3, ubu);

            PROTECT(listn = Rf_allocVector(STRSXP, 4));
            SET_STRING_ELT(listn, 0, Rf_mkChar("lblower"));
            SET_STRING_ELT(listn, 1, Rf_mkChar("lbupper"));
            SET_STRING_ELT(listn, 2, Rf_mkChar("ublower"));
            SET_STRING_ELT(listn, 3, Rf_mkChar("ubupper"));

            Rf_setAttrib(out, R_NamesSymbol, listn);

            UNPROTECT(2);
        }

        UNPROTECT(4);

    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* access upper and lower sensitivity ranges for objective function
   coefficients for a specified range of variable indices */
SEXP objSa(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out   = R_NilValue;
    SEXP low   = R_NilValue;
    SEXP upp   = R_NilValue;
    SEXP listn = R_NilValue;

    int lgo = 0;

    checkEnv(env);
    checkProb(lp);

    lgo = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgo > 0) {

        PROTECT(low = Rf_allocVector(REALSXP, lgo));
        PROTECT(upp = Rf_allocVector(REALSXP, lgo));

        status = CPXobjsa(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          Rf_asInteger(begin), Rf_asInteger(end),
                          REAL(low), REAL(upp)
                         );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            PROTECT(out = Rf_allocVector(VECSXP, 2));
            SET_VECTOR_ELT(out, 0, low);
            SET_VECTOR_ELT(out, 1, upp);

            PROTECT(listn = Rf_allocVector(STRSXP, 2));
            SET_STRING_ELT(listn, 0, Rf_mkChar("lower"));
            SET_STRING_ELT(listn, 1, Rf_mkChar("upper"));

            Rf_setAttrib(out, R_NamesSymbol, listn);

            UNPROTECT(2);
        }

        UNPROTECT(2);

    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* access upper and lower sensitivity ranges for righthand side values of
   a range of constraints */
SEXP rhsSa(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out   = R_NilValue;
    SEXP low   = R_NilValue;
    SEXP upp   = R_NilValue;
    SEXP listn = R_NilValue;

    int lgr = 0;

    checkEnv(env);
    checkProb(lp);

    lgr = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgr > 0) {

        PROTECT(low = Rf_allocVector(REALSXP, lgr));
        PROTECT(upp = Rf_allocVector(REALSXP, lgr));

        status = CPXrhssa(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          Rf_asInteger(begin), Rf_asInteger(end),
                          REAL(low), REAL(upp)
                          );
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            PROTECT(out = Rf_allocVector(VECSXP, 2));
            SET_VECTOR_ELT(out, 0, low);
            SET_VECTOR_ELT(out, 1, upp);

            PROTECT(listn = Rf_allocVector(STRSXP, 2));
            SET_STRING_ELT(listn, 0, Rf_mkChar("lower"));
            SET_STRING_ELT(listn, 1, Rf_mkChar("upper"));

            Rf_setAttrib(out, R_NamesSymbol, listn);

            UNPROTECT(2);
        }

        UNPROTECT(2);

    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* open a file */
SEXP cplexfopen(SEXP fname, SEXP ftype, SEXP ptrtype) {

    SEXP fileext = R_NilValue;
    SEXP ptr, class;

    CPXFILEptr cpfile = NULL;

    const char *rfname = CHAR(STRING_ELT(fname, 0));
    const char *rftype = CHAR(STRING_ELT(ftype, 0));

    cpfile = CPXfopen(rfname, rftype);

    if (cpfile != NULL) {
        /* create pointer to file */
        PROTECT(ptr = Rf_allocVector(STRSXP, 1));
        SET_STRING_ELT(ptr, 0, STRING_ELT(ptrtype, 0));
        
        PROTECT(class = Rf_allocVector(STRSXP, 1));
        SET_STRING_ELT(class, 0, Rf_mkChar("cplex_file_ptr"));

        fileext = R_MakeExternalPtr(cpfile, tagCPLEXfile, R_NilValue);
        PROTECT(fileext);
        Rf_setAttrib(ptr, Rf_install("CPLEXfn"), fname);
        Rf_setAttrib(ptr, class, fileext);
        Rf_classgets(ptr, class);
        UNPROTECT(3);
    }
    else {
        ptr = R_NilValue;
    }

    return ptr;
}


/* -------------------------------------------------------------------------- */
/* close a file */
SEXP cplexfclose(SEXP cpfile) {

    SEXP out = R_NilValue;
    CPXFILEptr del = NULL;

    checkFile(cpfile);

    del = R_ExternalPtrAddr(cpfile);

    status = CPXfclose(del);
    if (status != 0) {
        out = cpx_error(status);
    }
    else {
        R_ClearExternalPtr(cpfile);
    }

    return out;
}

/* -------------------------------------------------------------------------- */
/* write to file */
SEXP fileput(SEXP cpfile, SEXP stuff) {

    SEXP out = R_NilValue;

    const char *rstuff = CHAR(STRING_ELT(stuff, 0));

    checkFile(cpfile);

    status = CPXfputs(rstuff, R_ExternalPtrAddr(cpfile));

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* modify log file */
SEXP setLogFile(SEXP env, SEXP cpfile) {

    SEXP out = R_NilValue;

    CPXFILEptr rcpfile;

    if (cpfile == R_NilValue) {
        rcpfile = NULL;
    }
    else {
        checkFile(cpfile);
        rcpfile = R_ExternalPtrAddr(cpfile);
    }

    checkEnv(env);

    status = CPXsetlogfile(R_ExternalPtrAddr(env), rcpfile);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access log file */
SEXP getLogFile(SEXP env, SEXP ptrtype) {

    SEXP logfout = R_NilValue;
    SEXP ptr, class;

    CPXFILEptr logfile = NULL;

    checkEnv(env);

    status = CPXgetlogfile(R_ExternalPtrAddr(env), &logfile);

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        ptr = cpx_error(status);
    }
    else {
        /* create pointer to file */
        PROTECT(ptr = Rf_allocVector(STRSXP, 1));
        SET_STRING_ELT(ptr, 0, STRING_ELT(ptrtype, 0));
        
        PROTECT(class = Rf_allocVector(STRSXP, 1));
        SET_STRING_ELT(class, 0, Rf_mkChar("cplex_file_ptr"));

        logfout = R_MakeExternalPtr(logfile, tagCPLEXfile, R_NilValue);
        PROTECT(logfout);
        Rf_setAttrib(ptr, class, logfout);
        Rf_classgets(ptr, class);
        UNPROTECT(3);
    }

    return ptr;
}


/* -------------------------------------------------------------------------- */
/* obtain pointers to the four default channels */
SEXP getChannels(SEXP env, SEXP ptrtype) {

    SEXP resout  = R_NilValue;
    SEXP warnout = R_NilValue;
    SEXP errout  = R_NilValue;
    SEXP logout  = R_NilValue;

    SEXP ptr, class;

    CPXCHANNELptr results = NULL;
    CPXCHANNELptr warning = NULL;
    CPXCHANNELptr error   = NULL;
    CPXCHANNELptr log     = NULL;

    checkEnv(env);

    status = CPXgetchannels(R_ExternalPtrAddr(env),
                            &results, &warning, &error, &log
                           );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        ptr = cpx_error(status);
    }
    else {
        /* create channel pointers */
        PROTECT(ptr = Rf_allocVector(STRSXP, 1));
        SET_STRING_ELT(ptr, 0, STRING_ELT(ptrtype, 0));

        PROTECT(class = Rf_allocVector(STRSXP, 1));
        SET_STRING_ELT(class, 0, Rf_mkChar("cplex_chan_ptr"));

        resout  = R_MakeExternalPtr(results, tagCPLEXchannel, R_NilValue);
        PROTECT(resout);
        Rf_setAttrib(ptr, Rf_install("cpxresults"), resout);

        warnout = R_MakeExternalPtr(warning, tagCPLEXchannel, R_NilValue);
        PROTECT(warnout);
        Rf_setAttrib(ptr, Rf_install("cpxwarning"), warnout);

        errout  = R_MakeExternalPtr(error, tagCPLEXchannel, R_NilValue);
        PROTECT(errout);
        Rf_setAttrib(ptr, Rf_install("cpxerror"), errout);

        logout  = R_MakeExternalPtr(log, tagCPLEXchannel, R_NilValue);
        PROTECT(logout);
        Rf_setAttrib(ptr, Rf_install("cpxlog"), logout);

        Rf_classgets(ptr, class);
        UNPROTECT(6);
    }

    return ptr;
}


/* -------------------------------------------------------------------------- */
/* flush the output buffers of the four standard channels */
SEXP flushStdChannels(SEXP env) {

    SEXP out = R_NilValue;

    checkEnv(env);

    status = CPXflushstdchannels(R_ExternalPtrAddr(env));
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* instantiate a new channel object */
SEXP addChannel(SEXP env, SEXP ptrtype) {

    SEXP chout = R_NilValue;
    SEXP ptr, class;

    CPXCHANNELptr newch = NULL;

    checkEnv(env);

    newch = CPXaddchannel(R_ExternalPtrAddr(env));

    if (newch != NULL) {
        /* create channel pointer */
        PROTECT(ptr = Rf_allocVector(STRSXP, 1));
        SET_STRING_ELT(ptr, 0, STRING_ELT(ptrtype, 0));
        
        PROTECT(class = Rf_allocVector(STRSXP, 1));
        SET_STRING_ELT(class, 0, Rf_mkChar("cplex_chan_ptr"));
    
        chout = R_MakeExternalPtr(newch, tagCPLEXchannel, R_NilValue);
        PROTECT(chout);
        Rf_setAttrib(ptr, class, chout);
        Rf_classgets(ptr, class);
        UNPROTECT(3);
    }
    else {
        ptr = R_NilValue;
    }

    return ptr;
}


/* -------------------------------------------------------------------------- */
/* flush all message destinations for a channel, ... */
SEXP delChannel(SEXP env, SEXP newch) {

    SEXP out = R_NilValue;
    CPXCHANNELptr delch = NULL;

    checkEnv(env);
    checkChannel(newch);

    delch = R_ExternalPtrAddr(newch);

    CPXdelchannel(R_ExternalPtrAddr(env), &delch);

    R_ClearExternalPtr(newch);

    return out;
}


/* -------------------------------------------------------------------------- */
/* flush all message destinations associated with a channel */
SEXP disconnectChannel(SEXP env, SEXP newch) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkChannel(newch);

    CPXdisconnectchannel(R_ExternalPtrAddr(env), R_ExternalPtrAddr(newch));

    return out;
}


/* -------------------------------------------------------------------------- */
/* flush all message destinations associated with a channel */
SEXP flushChannel(SEXP env, SEXP newch) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkChannel(newch);

    CPXflushchannel(R_ExternalPtrAddr(env), R_ExternalPtrAddr(newch));

    return out;
}


/* -------------------------------------------------------------------------- */
/* add a file to the list of message destinations for a channel */
SEXP addFpDest(SEXP env, SEXP newch, SEXP cpfile) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkChannel(newch);
    checkFile(cpfile);

    status = CPXaddfpdest(R_ExternalPtrAddr(env), R_ExternalPtrAddr(newch),
                          R_ExternalPtrAddr(cpfile)
                         );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* remove a file to the list of message destinations for a channel */
SEXP delFpDest(SEXP env, SEXP newch, SEXP cpfile) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkChannel(newch);
    checkFile(cpfile);

    status = CPXdelfpdest(R_ExternalPtrAddr(env), R_ExternalPtrAddr(newch),
                          R_ExternalPtrAddr(cpfile)
                         );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* This routine returns a time stamp */
SEXP getTime(SEXP env) {

    SEXP out = R_NilValue;

    double timest = 0;

    checkEnv(env);

    status = CPXgettime(R_ExternalPtrAddr(env), &timest);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarReal(timest);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* tune the parameters of the environment for improved optimizer performance on
   the specified problem object */
SEXP tuneParam(SEXP env, SEXP lp,
               SEXP nIntP, SEXP intP, SEXP intPv,
               SEXP nDblP, SEXP dblP, SEXP dblPv,
               SEXP nStrP, SEXP strP, SEXP strPv) {

    SEXP out = R_NilValue;

    int k, numstrP, tstat;

    const int *rintP, *rintPv, *rdblP, *rstrP;
    const double *rdblPv;
    const char **rstrPv;

    checkEnv(env);
    checkProb(lp);

    if (intP == R_NilValue) {
        rintP = NULL;
    }
    else {
        rintP = INTEGER(intP);
    }

    if (intPv == R_NilValue) {
        rintPv = NULL;
    }
    else {
        rintPv = INTEGER(intPv);
    }

    if (dblP == R_NilValue) {
        rdblP = NULL;
    }
    else {
        rdblP = INTEGER(dblP);
    }

    if (dblPv == R_NilValue) {
        rdblPv = NULL;
    }
    else {
        rdblPv = REAL(dblPv);
    }

    if (strP == R_NilValue) {
        rstrP = NULL;
    }
    else {
        rstrP = INTEGER(strP);
    }

    if (strPv == R_NilValue) {
        rstrPv = NULL;
    }
    else {
        numstrP = Rf_length(strPv);
        rstrPv = R_Calloc(numstrP, const char *);
        for (k = 0; k < numstrP; k++) {
            rstrPv[k] = CHAR(STRING_ELT(strPv, k));
        }
    }

    status = CPXtuneparam(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          Rf_asInteger(nIntP), rintP, rintPv,
                          Rf_asInteger(nDblP), rdblP, rdblPv,
                          Rf_asInteger(nStrP), rstrP, (char **) rstrPv, &tstat
                         );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarInteger(tstat);
    }

    if (strPv != R_NilValue) {
        R_Free(rstrPv);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* set termination signal */
SEXP setTerminate(SEXP env, SEXP ptrtype) {

    SEXP termext = R_NilValue;
    SEXP ptr, class;

    checkEnv(env);

    status = CPXsetterminate(R_ExternalPtrAddr(env), &terminate);

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        ptr = cpx_error(status);
    }
    else {
        /* create termination signal pointer */
        PROTECT(ptr = Rf_allocVector(STRSXP, 1));
        SET_STRING_ELT(ptr, 0, STRING_ELT(ptrtype, 0));
        
        PROTECT(class = Rf_allocVector(STRSXP, 1));
        SET_STRING_ELT(class, 0, Rf_mkChar("cplex_term_ptr"));

        termext = R_MakeExternalPtr((void *) &terminate,
                                    tagCPLEXtermination, R_NilValue
                                   );
        PROTECT(termext);
        Rf_setAttrib(ptr, class, termext);
        Rf_classgets(ptr, class);
        UNPROTECT(3);
    }

    return ptr;
}


/* -------------------------------------------------------------------------- */
/* release termination signal */
SEXP delTerminate(SEXP env, SEXP tsig) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkTermination(tsig);

    status = CPXsetterminate(R_ExternalPtrAddr(env), NULL);

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }
    else {
        R_ClearExternalPtr(tsig);
        terminate = 0;
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* change termination signal */
SEXP chgTerminate(SEXP env, SEXP tval) {

    SEXP out = R_NilValue;

    checkEnv(env);

    terminate = Rf_asInteger(tval);

    return out;
}


/* -------------------------------------------------------------------------- */
/* print termination signal */
SEXP printTerminate(SEXP env) {

    SEXP out = R_NilValue;

    checkEnv(env);

    Rprintf("%i\n", terminate);

    return out;
}


/* -------------------------------------------------------------------------- */
/* add multiple MIP starts to a CPLEX problem object */
SEXP addMIPstarts(SEXP env, SEXP lp, SEXP mcnt, SEXP nzcnt,
                  SEXP beg, SEXP varindices, SEXP values,
                  SEXP effortlevel, SEXP mipstartname
                 ) {

    SEXP out = R_NilValue;

    int k, nnames;
    const int *rbeg         = INTEGER(beg);
    const int *rvarindices  = INTEGER(varindices);
    const double *rvalues   = REAL(values);
    const int *reffortlevel = INTEGER(effortlevel);
    const char ** rmipstartname;

    checkEnv(env);
    checkProb(lp);

    if (mipstartname == R_NilValue) {
        rmipstartname = NULL;
    }
    else {
        nnames = Rf_length(mipstartname);
        rmipstartname = R_Calloc(nnames, const char *);
        for (k = 0; k < nnames; k++) {
            rmipstartname[k] = CHAR(STRING_ELT(mipstartname, k));
        }
    }

    status = CPXaddmipstarts(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                             Rf_asInteger(mcnt), Rf_asInteger(nzcnt),
                             rbeg, rvarindices, rvalues, reffortlevel,
                             (char **) rmipstartname
                            );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    if (mipstartname != R_NilValue) {
        R_Free(rmipstartname);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* modify or extend multiple MIP starts */
SEXP chgMIPstarts(SEXP env, SEXP lp, SEXP mcnt, SEXP mipstartindices,
                  SEXP nzcnt, SEXP beg, SEXP varindices,
                  SEXP values, SEXP effortlevel
                 ) {

    SEXP out = R_NilValue;

    const int *rmipstartindices = INTEGER(mipstartindices);
    const int *rbeg             = INTEGER(beg);
    const int *rvarindices      = INTEGER(varindices);
    const double *rvalues       = REAL(values);
    const int *reffortlevel     = INTEGER(effortlevel);

    checkEnv(env);
    checkProb(lp);

    status = CPXchgmipstarts(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                             Rf_asInteger(mcnt), rmipstartindices,
                             Rf_asInteger(nzcnt),
                             rbeg, rvarindices, rvalues, reffortlevel
                            );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access a range of MIP starts of a CPLEX problem object */
SEXP getMIPstarts(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out         = R_NilValue;
    SEXP listn       = R_NilValue;
    SEXP beg         = R_NilValue;
    SEXP varindices  = R_NilValue;
    SEXP values      = R_NilValue;
    SEXP effortlevel = R_NilValue;

    int ret, sp;
    int lgbeg = 0;
    int stsp  = 0;
    int nzcnt = 0;

    SEXP TMPa = R_NilValue;
    SEXP TMPb = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    lgbeg = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgbeg > 0) {

        PROTECT(beg         = Rf_allocVector(INTSXP, lgbeg));
        PROTECT(effortlevel = Rf_allocVector(INTSXP, lgbeg));

        PROTECT(TMPa = Rf_allocVector(INTSXP, 0));
        PROTECT(TMPb = Rf_allocVector(REALSXP, 0));

        ret = CPXgetmipstarts(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                              &nzcnt, INTEGER(beg), INTEGER(TMPa), REAL(TMPb),
                              INTEGER(effortlevel), 0, &sp,
                              Rf_asInteger(begin), Rf_asInteger(end)
                             );
        /* Rprintf("ret %i\n", sp); */
        UNPROTECT(2);

        if (ret == CPXERR_NEGATIVE_SURPLUS) {
            stsp               -= sp;
            PROTECT(varindices  = Rf_allocVector(INTSXP, stsp));
            PROTECT(values      = Rf_allocVector(REALSXP, stsp));
            status = CPXgetmipstarts(R_ExternalPtrAddr(env),
                                     R_ExternalPtrAddr(lp), &nzcnt,
                                     INTEGER(beg), INTEGER(varindices),
                                     REAL(values), INTEGER(effortlevel),
                                     stsp, &sp,
                                     Rf_asInteger(begin), Rf_asInteger(end)
                                  );
            if (status != 0) {
                status_message(R_ExternalPtrAddr(env), status);
                out = cpx_error(status);
            }
            else {
                PROTECT(out = Rf_allocVector(VECSXP, 4));
                SET_VECTOR_ELT(out, 0, beg);
                SET_VECTOR_ELT(out, 1, varindices);
                SET_VECTOR_ELT(out, 2, values);
                SET_VECTOR_ELT(out, 3, effortlevel);
    
                PROTECT(listn = Rf_allocVector(STRSXP, 4));
                SET_STRING_ELT(listn, 0, Rf_mkChar("beg"));
                SET_STRING_ELT(listn, 1, Rf_mkChar("varindices"));
                SET_STRING_ELT(listn, 2, Rf_mkChar("values"));
                SET_STRING_ELT(listn, 3, Rf_mkChar("effortlevel"));
    
                Rf_setAttrib(out, R_NamesSymbol, listn);
    
                UNPROTECT(2);
            }
            UNPROTECT(2);
        }
        else {
            if (ret != 0) {
                status_message(R_ExternalPtrAddr(env), ret);
                out = cpx_error(ret);
            }
        }
        UNPROTECT(2);
    }

    return out;

}


/* -------------------------------------------------------------------------- */
/* access the number of MIP starts in the CPLEX problem object */
SEXP getNumMIPstarts(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    int nmips;

    checkEnv(env);
    checkProb(lp);

    nmips = CPXgetnummipstarts(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(nmips);

    return out;
}


/* -------------------------------------------------------------------------- */
/* delete a range MIP starts */
SEXP delMIPstarts(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXdelmipstarts(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                             Rf_asInteger(begin), Rf_asInteger(end)
                            );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* write a range of MIP starts of a CPLEX problem object to a file
   in MST format */
SEXP writeMIPstarts(SEXP env, SEXP lp, SEXP fname, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;

    const char *rfname = CHAR(STRING_ELT(fname, 0));

    checkEnv(env);
    checkProb(lp);

    status = CPXwritemipstarts(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                               rfname, Rf_asInteger(begin), Rf_asInteger(end)
                              );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}

/* -------------------------------------------------------------------------- */
/* read a file in the format MST and copy the information of all the MIP starts
   contained in that file into a CPLEX problem object */
SEXP readCopyMIPstarts(SEXP env, SEXP lp, SEXP fname) {

    SEXP out = R_NilValue;

    const char *rfname = CHAR(STRING_ELT(fname, 0));

    checkEnv(env);
    checkProb(lp);

    status = CPXreadcopymipstarts(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                  rfname
                                 );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access a range of names of MIP starts */
SEXP getMIPstartName(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;

    int ret, sp, k;
    int lgname = 0;
    int stsp = 0;
    char **name = NULL;
    char *store = NULL;

    checkEnv(env);
    checkProb(lp);

    lgname = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgname > 0) {

        ret = CPXgetmipstartname(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                 NULL, NULL, 0, &sp,
                                 Rf_asInteger(begin), Rf_asInteger(end)
                                );

        if (ret == CPXERR_NEGATIVE_SURPLUS) {
            stsp  -= sp;
            name   = R_Calloc(lgname, char *);
            store  = R_Calloc(stsp, char);
            status = CPXgetmipstartname(R_ExternalPtrAddr(env),
                                        R_ExternalPtrAddr(lp),
                                        name, store, stsp, &sp,
                                        Rf_asInteger(begin), Rf_asInteger(end)
                                       );
            if (status != 0) {
                status_message(R_ExternalPtrAddr(env), status);
                out = cpx_error(status);
            }
            else {
                PROTECT(out = Rf_allocVector(STRSXP, lgname));
                for (k = 0; k < lgname; k++) {
                    SET_STRING_ELT(out, k, Rf_mkChar(name[k]));
                }
                UNPROTECT(1);
            }
            R_Free(name);
            R_Free(store);
        }
        else {
            if (ret != 0) {
                status_message(R_ExternalPtrAddr(env), ret);
                out = cpx_error(ret);
            }
        }
    }

    return out;

}


/* -------------------------------------------------------------------------- */
/* search for the index number of the specified MIP start */
SEXP getMIPstartIndex(SEXP env, SEXP lp, SEXP iname) {

    SEXP out = R_NilValue;

    const char *riname = CHAR(STRING_ELT(iname, 0));

    int rindex = -1;

    checkEnv(env);
    checkProb(lp);

    status = CPXgetmipstartindex(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                 riname, &rindex
                                );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarInteger(rindex);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* refine a conflict in order to determine why a given MIP start is not
   feasible */
SEXP refineMIPstartConflict(SEXP env, SEXP lp, SEXP mipstartindex) {

    SEXP out   = R_NilValue;
    SEXP listn = R_NilValue;

    int ncr = 0, ncc = 0;

    checkEnv(env);
    checkProb(lp);

    status = CPXrefinemipstartconflict(R_ExternalPtrAddr(env),
                                       R_ExternalPtrAddr(lp),
                                       Rf_asInteger(mipstartindex),
                                       &ncr, &ncc
                                      );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        PROTECT(out = Rf_allocVector(VECSXP, 2));
        SET_VECTOR_ELT(out, 0, Rf_ScalarInteger(ncr));
        SET_VECTOR_ELT(out, 1, Rf_ScalarInteger(ncc));

        PROTECT(listn = Rf_allocVector(STRSXP, 2));
        SET_STRING_ELT(listn, 0, Rf_mkChar("confnumrows"));
        SET_STRING_ELT(listn, 1, Rf_mkChar("confnumcols"));

        Rf_setAttrib(out, R_NamesSymbol, listn);

        UNPROTECT(2);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* identify a minimal conflict for the infeasibility of the MIP start or a
   subset of the constraints in the model */
SEXP refineMIPstartConflictExt(SEXP env, SEXP lp, SEXP mipstartindex,
                               SEXP grpcnt, SEXP concnt, SEXP grppref,
                               SEXP grpbeg, SEXP grpind, SEXP grptype
                              ) {

    SEXP out = R_NilValue;

    const double *rgrppref = REAL(grppref);
    const int *rgrpbeg     = INTEGER(grpbeg);
    const int *rgrpind     = INTEGER(grpind);
    const char *rgrptype   = CHAR(STRING_ELT(grptype, 0));

    checkEnv(env);
    checkProb(lp);

    status = CPXrefinemipstartconflictext(R_ExternalPtrAddr(env),
                                          R_ExternalPtrAddr(lp),
                                          Rf_asInteger(mipstartindex),
                                          Rf_asInteger(grpcnt),
                                          Rf_asInteger(concnt),
                                          rgrppref, rgrpbeg, rgrpind, rgrptype
                                         );

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* return the number of nonzeros in the Q matrix */
SEXP getNumQPnz(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    int nnz;

    checkEnv(env);
    checkProb(lp);

    nnz = CPXgetnumqpnz(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(nnz);

    return out;
}


/* -------------------------------------------------------------------------- */
/* return the number of variables that have quadratic objective coefficients */
SEXP getNumQuad(SEXP env, SEXP lp) {

    SEXP out = R_NilValue;
    int nq;

    checkEnv(env);
    checkProb(lp);

    nq = CPXgetnumquad(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp));

    out = Rf_ScalarInteger(nq);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access the quadratic coefficient in the matrix Q */
SEXP getQPcoef(SEXP env, SEXP lp, SEXP i, SEXP j) {

    SEXP out = R_NilValue;

    double coef;

    checkEnv(env);
    checkProb(lp);

    status = CPXgetqpcoef(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          Rf_asInteger(i),Rf_asInteger(j), &coef
                         );
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
        out = cpx_error(status);
    }
    else {
        out = Rf_ScalarReal(coef);
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* access a range of columns of the matrix Q of a model with a quadratic
   objective function */
SEXP getQuad(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out     = R_NilValue;
    SEXP listn   = R_NilValue;
    SEXP qmatbeg = R_NilValue;
    SEXP qmatind = R_NilValue;
    SEXP qmatval = R_NilValue;

    int ret, sp;
    int qmatsp = 0;
    int nnz    = 0;
    int lgcols = 0;

    checkEnv(env);
    checkProb(lp);

    lgcols = Rf_asInteger(end) - Rf_asInteger(begin) + 1;

    if (lgcols > 0) {

        PROTECT(qmatbeg = Rf_allocVector(INTSXP, lgcols));

        ret = CPXgetquad(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                         &nnz, INTEGER(qmatbeg), NULL, NULL, 0, &sp,
                         Rf_asInteger(begin), Rf_asInteger(end)
                         );

        if (ret == CPXERR_NEGATIVE_SURPLUS) {
            qmatsp -= sp;
            PROTECT(qmatind = Rf_allocVector(INTSXP, qmatsp));
            PROTECT(qmatval = Rf_allocVector(REALSXP, qmatsp));
            status = CPXgetcols(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                &nnz, INTEGER(qmatbeg), INTEGER(qmatind),
                                REAL(qmatval), qmatsp, &sp,
                                Rf_asInteger(begin), Rf_asInteger(end)
                                );

            if (status != 0) {
                status_message(R_ExternalPtrAddr(env), status);
                out = cpx_error(status);
            }
            else {
                PROTECT(out = Rf_allocVector(VECSXP, 3));
                SET_VECTOR_ELT(out, 0, qmatbeg);
                SET_VECTOR_ELT(out, 1, qmatind);
                SET_VECTOR_ELT(out, 2, qmatval);

                PROTECT(listn = Rf_allocVector(STRSXP, 3));
                SET_STRING_ELT(listn, 0, Rf_mkChar("qmatbeg"));
                SET_STRING_ELT(listn, 1, Rf_mkChar("qmatind"));
                SET_STRING_ELT(listn, 2, Rf_mkChar("qmatval"));
                Rf_setAttrib(out, R_NamesSymbol, listn);

                UNPROTECT(2);
            }
            UNPROTECT(2);
        }
        else {
            if (ret != 0) {
                status_message(R_ExternalPtrAddr(env), ret);
                out = cpx_error(ret);
            }
        }

        UNPROTECT(1);

    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* copy a priority order to a CPLEX problem object */
SEXP copyOrder(SEXP env, SEXP lp, SEXP cnt, SEXP ind, SEXP prior, SEXP dir) {

    SEXP out = R_NilValue;

    int *rind = INTEGER(ind);
    const int *rprior;
    const int *rdir;

    checkEnv(env);
    checkProb(lp);

    if (prior == R_NilValue) {
        rprior = NULL;
    }
    else {
        rprior = INTEGER(prior);
    }

    if (dir == R_NilValue) {
        rdir = NULL;
    }
    else {
        rdir = INTEGER(dir);
    }

    status = CPXcopyorder(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          Rf_asInteger(cnt), rind, rprior, rdir
                        );

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access all the MIP priority order information */
SEXP getOrder(SEXP env, SEXP lp) {

    SEXP out   = R_NilValue;
    SEXP listn = R_NilValue;
    SEXP ind   = R_NilValue;
    SEXP prior = R_NilValue;
    SEXP dir   = R_NilValue;

    int ret, sp;
    int nentr = 0;
    int ordsp = 0;

    checkEnv(env);
    checkProb(lp);

    ret = CPXgetorder(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                      &nentr, NULL, NULL, NULL, 0, &sp);

    if (ret == CPXERR_NEGATIVE_SURPLUS) {
        ordsp -= sp;
        PROTECT(ind   = Rf_allocVector(INTSXP, ordsp));
        PROTECT(prior = Rf_allocVector(INTSXP, ordsp));
        PROTECT(dir   = Rf_allocVector(INTSXP, ordsp));
        status = CPXgetorder(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                             &nentr, INTEGER(ind), INTEGER(prior), INTEGER(dir),
                             ordsp, &sp);
        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            PROTECT(out = Rf_allocVector(VECSXP, 3));
            SET_VECTOR_ELT(out, 0, ind);
            SET_VECTOR_ELT(out, 1, prior);
            SET_VECTOR_ELT(out, 2, dir);

            PROTECT(listn = Rf_allocVector(STRSXP, 3));
            SET_STRING_ELT(listn, 0, Rf_mkChar("indices"));
            SET_STRING_ELT(listn, 1, Rf_mkChar("priority"));
            SET_STRING_ELT(listn, 2, Rf_mkChar("direction"));
            Rf_setAttrib(out, R_NamesSymbol, listn);

            UNPROTECT(2);
        }
        UNPROTECT(3);
    }
    else {
        if (ret != 0) {
            status_message(R_ExternalPtrAddr(env), ret);
            out = cpx_error(ret);
        }
    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* write a priority order to an ORD file */
SEXP ordWrite(SEXP env, SEXP lp, SEXP fname) {

    SEXP out = R_NilValue;

    const char *rfname = CHAR(STRING_ELT(fname, 0));

    checkEnv(env);
    checkProb(lp);

    status = CPXordwrite(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp), rfname);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* read ORD file and copy priority order information into a problem object */
SEXP readCopyOrder(SEXP env, SEXP lp, SEXP fname) {

    SEXP out = R_NilValue;

    const char *rfname = CHAR(STRING_ELT(fname, 0));

    checkProb(lp);
    checkEnv(env);

    status = CPXreadcopyorder(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                              rfname);
    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* add quadratic constraint to a specified CPLEX problem object */
SEXP addQConstr(SEXP env, SEXP lp, SEXP lzn, SEXP qzn,
                SEXP rhs, SEXP sense,
                SEXP lind, SEXP lval,
                SEXP qrow, SEXP qcol, SEXP qval, SEXP qname) {

    SEXP out = R_NilValue;

    /* const char *rsense  = CHAR(STRING_ELT(sense, 0)); */
    const int *rlind;
    const double *rlval;
    const int *rqrow    = INTEGER(qrow);
    const int *rqcol    = INTEGER(qcol);
    const double *rqval = REAL(qval);
    const char *rqname;


    if (lind == R_NilValue) {
        rlind = NULL;
    }
    else {
        rlind = INTEGER(lind);
    }

    if (lval == R_NilValue) {
        rlval = NULL;
    }
    else {
        rlval = REAL(lval);
    }

    if (qname == R_NilValue) {
        rqname = NULL;
    }
    else {
        rqname = CHAR(STRING_ELT(qname, 0));
    }

    checkProb(lp);
    checkEnv(env);

    /* CHAR(STRING_ELT(VECTOR_ELT(sense, 0), 0))[0], */
    status = CPXaddqconstr(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                           Rf_asInteger(lzn), Rf_asInteger(qzn), Rf_asReal(rhs),
                           CHAR(STRING_ELT(sense, 0))[0],
                           rlind, rlval, rqrow, rqcol, rqval, rqname);

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* delete a range of quadratic constraints */
SEXP delQConstrs(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXdelqconstrs(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                            Rf_asInteger(begin), Rf_asInteger(end));

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access a quadratic constraint on the variables of a problem object */
SEXP getQConstr(SEXP env, SEXP lp, SEXP which) {

    SEXP out     = R_NilValue;
    SEXP listn   = R_NilValue;
    SEXP linind  = R_NilValue;
    SEXP linval  = R_NilValue;
    SEXP quadrow = R_NilValue;
    SEXP quadcol = R_NilValue;
    SEXP quadval = R_NilValue;
    SEXP senseo  = R_NilValue;

    int ret, lsp, qsp, rlc, rqc;
    double rrhs;
    char rsense;

    int linsp = 0;
    int qadsp = 0;

    checkEnv(env);
    checkProb(lp);

    ret = CPXgetqconstr(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                        &rlc, &rqc, &rrhs, &rsense, NULL, NULL, linsp, &lsp,
                        NULL, NULL, NULL, qadsp, &qsp, Rf_asInteger(which));

    if (ret == CPXERR_NEGATIVE_SURPLUS) {
        linsp -= lsp;
        qadsp -= qsp;
        PROTECT(linind  = Rf_allocVector(INTSXP,  linsp));
        PROTECT(linval  = Rf_allocVector(REALSXP, linsp));
        PROTECT(quadrow = Rf_allocVector(INTSXP,  qadsp));
        PROTECT(quadcol = Rf_allocVector(INTSXP,  qadsp));
        PROTECT(quadval = Rf_allocVector(REALSXP, qadsp));

        status = CPXgetqconstr(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                               &rlc, &rqc, &rrhs, &rsense, INTEGER(linind), REAL(linval),
                               linsp, &lsp, INTEGER(quadrow), INTEGER(quadcol),
                               REAL(quadval), qadsp, &qsp, Rf_asInteger(which));

        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            
            PROTECT(senseo = Rf_allocVector(STRSXP, 1));
            SET_STRING_ELT(senseo, 0, Rf_mkChar(&rsense));
            
            PROTECT(out = Rf_allocVector(VECSXP, 7));
            SET_VECTOR_ELT(out, 0, Rf_ScalarReal(rrhs));
            SET_VECTOR_ELT(out, 1, senseo);
            SET_VECTOR_ELT(out, 2, linind);
            SET_VECTOR_ELT(out, 3, linval);
            SET_VECTOR_ELT(out, 4, quadrow);
            SET_VECTOR_ELT(out, 5, quadcol);
            SET_VECTOR_ELT(out, 6, quadval);

            PROTECT(listn = Rf_allocVector(STRSXP, 7));
            SET_STRING_ELT(listn, 0, Rf_mkChar("rhs"));
            SET_STRING_ELT(listn, 1, Rf_mkChar("sense"));
            SET_STRING_ELT(listn, 2, Rf_mkChar("linind"));
            SET_STRING_ELT(listn, 3, Rf_mkChar("linval"));
            SET_STRING_ELT(listn, 4, Rf_mkChar("quadrow"));
            SET_STRING_ELT(listn, 5, Rf_mkChar("quadcol"));
            SET_STRING_ELT(listn, 6, Rf_mkChar("quadval"));
            Rf_setAttrib(out, R_NamesSymbol, listn);

            UNPROTECT(3);
        }
        UNPROTECT(5);

    }

    return out;
}


/* -------------------------------------------------------------------------- */
/* add an indicator constraint to the specified problem object */
SEXP addIndConstr(SEXP env, SEXP lp, SEXP indvar, SEXP complemented,
                  SEXP nzcnt, SEXP rhs, SEXP sense, SEXP linind, SEXP linval,
                  SEXP indname) {

    SEXP out = R_NilValue;

    const int *rlinind      = INTEGER(linind);
    const double *rlinval   = REAL(linval);
    const char * rindname;

    checkEnv(env);
    checkProb(lp);

    if (indname == R_NilValue) {
        rindname = NULL;
    }
    else {
        rindname = CHAR(STRING_ELT(indname, 0));
    }

    status = CPXaddindconstr(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                             Rf_asInteger(indvar), Rf_asInteger(complemented),
                             Rf_asInteger(nzcnt), Rf_asReal(rhs),
                             CHAR(STRING_ELT(sense, 0))[0],
                             rlinind, rlinval, rindname);

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* delete a range of indicator constraints */
SEXP delIndConstrs(SEXP env, SEXP lp, SEXP begin, SEXP end) {

    SEXP out = R_NilValue;

    checkEnv(env);
    checkProb(lp);

    status = CPXdelindconstrs(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                              Rf_asInteger(begin), Rf_asInteger(end));

    if (status != 0) {
        status_message(R_ExternalPtrAddr(env), status);
    }

    out = Rf_ScalarInteger(status);

    return out;
}


/* -------------------------------------------------------------------------- */
/* access an indicator constraint on the variables of a problem object */
SEXP getIndConstr(SEXP env, SEXP lp, SEXP which) {

    SEXP out     = R_NilValue;
    SEXP listn   = R_NilValue;
    SEXP linind  = R_NilValue;
    SEXP linval  = R_NilValue;
    SEXP senseo  = R_NilValue;

    int ret, sp, ind, comp, nnz;
    double rrhs;
    char rsense;

    int linsp = 0;

    checkEnv(env);
    checkProb(lp);

    ret = CPXgetindconstr(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                          &ind, &comp, &nnz, &rrhs, &rsense, NULL, NULL, linsp,
                          &sp, Rf_asInteger(which));

    if (ret == CPXERR_NEGATIVE_SURPLUS) {
        linsp -= sp;
        PROTECT(linind  = Rf_allocVector(INTSXP,  linsp));
        PROTECT(linval  = Rf_allocVector(REALSXP, linsp));

        status = CPXgetindconstr(R_ExternalPtrAddr(env), R_ExternalPtrAddr(lp),
                                 &ind, &comp, &nnz, &rrhs, &rsense,
                                 INTEGER(linind), REAL(linval), linsp,
                                 &sp, Rf_asInteger(which));

        if (status != 0) {
            status_message(R_ExternalPtrAddr(env), status);
            out = cpx_error(status);
        }
        else {
            
            PROTECT(senseo = Rf_allocVector(STRSXP, 1));
            SET_STRING_ELT(senseo, 0, Rf_mkChar(&rsense));
            
            PROTECT(out = Rf_allocVector(VECSXP, 6));
            SET_VECTOR_ELT(out, 0, Rf_ScalarInteger(ind));
            SET_VECTOR_ELT(out, 1, Rf_ScalarLogical(comp));
            SET_VECTOR_ELT(out, 2, Rf_ScalarReal(rrhs));
            SET_VECTOR_ELT(out, 3, senseo);
            SET_VECTOR_ELT(out, 4, linind);
            SET_VECTOR_ELT(out, 5, linval);

            PROTECT(listn = Rf_allocVector(STRSXP, 6));
            SET_STRING_ELT(listn, 0, Rf_mkChar("indvar"));
            SET_STRING_ELT(listn, 1, Rf_mkChar("complemented"));
            SET_STRING_ELT(listn, 2, Rf_mkChar("rhs"));
            SET_STRING_ELT(listn, 3, Rf_mkChar("sense"));
            SET_STRING_ELT(listn, 4, Rf_mkChar("linind"));
            SET_STRING_ELT(listn, 5, Rf_mkChar("linval"));
            Rf_setAttrib(out, R_NamesSymbol, listn);

            UNPROTECT(3);
        }
        UNPROTECT(2);

    }

    return out;
}
