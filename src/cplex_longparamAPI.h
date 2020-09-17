/* cplex_longparamAPI.h
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
/* routines handling paramters of type CPX_PARAMTYPE_LONG (new in 12.3.0.0)   */
/* -------------------------------------------------------------------------- */

#if defined(CPX_VERSION) && (CPX_VERSION >= 12030000)

/* set CPLEX paramters of type CPXLONG */
SEXP setLongParm(SEXP env, SEXP parm, SEXP value);

/* get CPLEX paramters of type CPXLONG */
SEXP getLongParm(SEXP env, SEXP parm);

/* get the default value and range of a CPLEX prarmeter of type CPXLONG */
SEXP getInfoLongParm(SEXP env, SEXP parm);

#endif
