/* cplex_checkAPI.h
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


extern SEXP tagCPLEXprob;
extern SEXP tagCPLEXenv;


/* -------------------------------------------------------------------------- */
/* diagnostic routines for debugging                                          */
/* -------------------------------------------------------------------------- */

#ifdef USE_CHECK

#if defined(CPX_VERSION) && (CPX_VERSION >= 12030000)
#   include <ilcplex/cplexcheck.h>
#endif

/* validate the arguments of the corresponding CPXcopylp routine */
SEXP checkCopyLp(SEXP env, SEXP lp, SEXP nCols, SEXP nRows, SEXP lpdir,
                 SEXP objf, SEXP rhs, SEXP sense,
                 SEXP matbeg, SEXP matcnt, SEXP matind, SEXP matval,
                 SEXP lb, SEXP ub, SEXP rngval);

/* validate the arguments of the corresponding CPXcopylpwnames routine */
SEXP checkCopyLpwNames(SEXP env, SEXP lp, SEXP nCols, SEXP nRows, SEXP lpdir,
                       SEXP objf, SEXP rhs, SEXP sense,
                       SEXP matbeg, SEXP matcnt, SEXP matind, SEXP matval,
                       SEXP lb, SEXP ub, SEXP rngval,
                       SEXP cnames, SEXP rnames);

/* validate the arguments of the corresponding CPXcopyquad routine */
SEXP checkCopyQuad(SEXP env, SEXP lp,
                   SEXP qmatbeg, SEXP qmatcnt, SEXP qmatind, SEXP qmatval);

/* validate the arguments of the corresponding CPXcopyqpsep routine */
SEXP checkCopyQPsep(SEXP env, SEXP lp, SEXP qsepvec);

/* validate the arguments of the corresponding CPXaddrows routine */
SEXP checkAddRows(SEXP env, SEXP lp, SEXP ncols, SEXP nrows, SEXP nnz,
                  SEXP rhs, SEXP sense, SEXP matbeg, SEXP matind, SEXP matval,
                  SEXP cnames, SEXP rnames);

/* validate the arguments of the corresponding CPXaddcols routine */
SEXP checkAddCols(SEXP env, SEXP lp, SEXP ncols, SEXP nnz, SEXP objf,
                  SEXP matbeg, SEXP matind, SEXP matval,
                  SEXP lb, SEXP ub, SEXP cnames);

/* validate the arguments of the corresponding CPXchgcoeflist routine */
SEXP checkChgCoefList(SEXP env, SEXP lp, SEXP nnz, SEXP ia, SEXP ja, SEXP ar);

/* validate the arguments of the corresponding CPXcopyctype routine */
SEXP checkCopyColType(SEXP env, SEXP lp, SEXP xctype);

/* check an array of indices and a corresponding array of values
   for input errors */
SEXP checkVals(SEXP env, SEXP lp, SEXP nval, SEXP rind, SEXP cind, SEXP val);

#endif
