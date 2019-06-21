/* cplexAPI.h
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


#include "cplexR.h"


extern SEXP tagCPLEXprob;
extern SEXP tagCPLEXenv;
extern SEXP tagCPLEXfile;
extern SEXP tagCPLEXchannel;
extern SEXP tagCPLEXtermination;

extern char errmsg[CPLEXAPIMSGBUFF];


/* -------------------------------------------------------------------------- */
/* help functions                                                             */
/* -------------------------------------------------------------------------- */

/* check for pointer to CPLEX problem object */
SEXP isCPLEXprobPtr(SEXP ptr);

/* check for pointer to CPLEX environment */
SEXP isCPLEXenvPtr(SEXP ptr);

/* check for pointer to CPLEX file */
SEXP isCPLEXfilePtr(SEXP ptr);

/* check for pointer to CPLEX channel */
SEXP isCPLEXchanPtr(SEXP ptr);

/* check for pointer to CPLEX termination signal */
SEXP isCPLEXtermPtr(SEXP ptr);

/* check for NULL pointer */
SEXP isNULLptr(SEXP ptr);


/* -------------------------------------------------------------------------- */
/* API functions                                                              */
/* -------------------------------------------------------------------------- */

/* return error message string */
SEXP getErrorStr(SEXP env, SEXP err);

/* return status string */
SEXP getStatStr(SEXP env, SEXP stat);

/* initialize cplex */
SEXP initCPLEX(void);

/* close cplex environment */
SEXP closeEnv(SEXP env);

/* open cplex environment */
SEXP openEnv(SEXP ptrtype);

/* remove problem object */
SEXP delProb(SEXP env, SEXP lp);

/* create new problem object */
SEXP initProb(SEXP env, SEXP pname, SEXP ptrtype);

/* clone problem object */
SEXP cloneProb(SEXP env, SEXP lp, SEXP ptrtype);

/* access the problem type that is currently stored in a problem object */
SEXP getProbType(SEXP env, SEXP lp);

/* change the current problem to a related problem */
SEXP chgProbType(SEXP env, SEXP lp, SEXP ptype);

/* get cplex version number */
SEXP getVersion(SEXP env);

/* set CPLEX default paramters */
SEXP setDefaultParm(SEXP env);

/* set CPLEX paramters of integer type */
SEXP setIntParm(SEXP env, SEXP parm, SEXP value);

/* get CPLEX paramters of integer type */
SEXP getIntParm(SEXP env, SEXP parm);

/* get the default value and range of a CPLEX prarmeter of type integer */
SEXP getInfoIntParm(SEXP env, SEXP parm);

/* set CPLEX paramters of double type */
SEXP setDblParm(SEXP env, SEXP parm, SEXP value);

/* get CPLEX paramters of double type */
SEXP getDblParm(SEXP env, SEXP parm);

/* get the default value and range of a CPLEX prarmeter of type double */
SEXP getInfoDblParm(SEXP env, SEXP parm);

/* set CPLEX paramters of string type */
SEXP setStrParm(SEXP env, SEXP parm, SEXP value);

/* get CPLEX paramters of string type */
SEXP getStrParm(SEXP env, SEXP parm);

/* get the default value of a CPLEX prarmeter of type string */
SEXP getInfoStrParm(SEXP env, SEXP parm);

/* get a parameter name */
SEXP getParmName(SEXP env, SEXP wparm);

/* get a parameter reference number */
SEXP getParmNum(SEXP env, SEXP nparm);

/* reads parameter names and settings from a file */
SEXP readCopyParm(SEXP env, SEXP fname);

/* write the name and current setting of CPLEX parameters that are not at their */
/* default setting to a text file */
SEXP writeParm(SEXP env, SEXP fname);

/* get parameter type */
SEXP getParmType(SEXP env, SEXP parm);

/* get an array of parameter numbers for parameters which are not set at their */
/* default values */
SEXP getChgParm(SEXP env);

/* set optimization direction */
SEXP setObjDir(SEXP env, SEXP lp, SEXP lpdir);

/* get optimization direction */
SEXP getObjDir(SEXP env, SEXP lp);

/* copy data that define an LP problem to a problem object */
SEXP copyLp(SEXP env, SEXP lp, SEXP nCols, SEXP nRows, SEXP lpdir,
            SEXP objf, SEXP rhs, SEXP sense,
            SEXP matbeg, SEXP matcnt, SEXP matind, SEXP matval,
            SEXP lb, SEXP ub, SEXP rngval);

/* copy LP data into a problem object in the same way as the routine CPXcopylp,
   but using some additional arguments to specify the names of constraints and
   variables in the problem object */
SEXP copyLpwNames(SEXP env, SEXP lp, SEXP nCols, SEXP nRows, SEXP lpdir,
                  SEXP objf, SEXP rhs, SEXP sense,
                  SEXP matbeg, SEXP matcnt, SEXP matind, SEXP matval,
                  SEXP lb, SEXP ub, SEXP rngval, SEXP cnames, SEXP rnames);

/* copy a quadratic objective matrix Q when Q is not diagonal */
SEXP copyQuad(SEXP env, SEXP lp,
              SEXP qmatbeg, SEXP qmatcnt, SEXP qmatind, SEXP qmatval);

/* copy the quadratic objective matrix Q for a separable QP problem */
SEXP copyQPsep(SEXP env, SEXP lp, SEXP qsepvec);

/* write a problem as text file */
SEXP writeProb(SEXP env, SEXP lp, SEXP fname, SEXP ftype);

/* reads an MPS, LP, or SAV file into an existing problem object */
SEXP readCopyProb(SEXP env, SEXP lp, SEXP fname, SEXP ftype);

/* write a dual formulation of the current problem object */
SEXP dualWrite(SEXP env, SEXP lp, SEXP fname);

/* performs presolve on a problem object */
SEXP presolve(SEXP env, SEXP lp, SEXP method);

/* access presolve status information for the columns and rows of the
   presolved problem in the original problem and of the original problem
   in the presolved problem */
SEXP getPreStat(SEXP env, SEXP lp);

/* performs bound strengthening and detects redundant rows */
SEXP basicPresolve(SEXP env, SEXP lp);

/* write a presolved version of the problem to a file */
SEXP preslvWrite(SEXP env, SEXP lp, SEXP fname);

/* return a pointer for the presolved problem */
SEXP getRedLp(SEXP env, SEXP lp, SEXP ptrtype);

/* return the objective offset between the original problem and
   the presolved problem */
SEXP getObjOffset(SEXP env, SEXP lp);

/* remove any scaling that CPLEX has applied to the resident problem and its
   associated data */
SEXP unscaleProb(SEXP env, SEXP lp);

/* add new empty constraints (rows) to a problem object */
SEXP newRows(SEXP env, SEXP lp,
             SEXP nrows, SEXP rhs, SEXP sense, SEXP rngval, SEXP rnames);

/* add constraints to a specified CPLEX problem object */
SEXP addRows(SEXP env, SEXP lp, SEXP ncols, SEXP nrows, SEXP nnz,
             SEXP rhs, SEXP sense, SEXP matbeg, SEXP matind, SEXP matval,
             SEXP cnames, SEXP rnames);

/* get the number of rows in the constraint matrix */
SEXP getNumRows(SEXP env, SEXP lp);

/* delete a range of rows */
SEXP delRows(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* delete a set of rows */
SEXP delSetRows(SEXP env, SEXP lp, SEXP delstat);

/* add new empty columns to a problem object */
SEXP newCols(SEXP env, SEXP lp,
             SEXP ncols, SEXP obj, SEXP lb, SEXP ub, SEXP xctype, SEXP cnames);

/* add columns to a specified CPLEX problem object */
SEXP addCols(SEXP env, SEXP lp, SEXP ncols, SEXP nnz, SEXP objf,
             SEXP matbeg, SEXP matind, SEXP matval,
             SEXP lb, SEXP ub, SEXP cnames);

/* get the number of columns in the constraint matrix */
SEXP getNumCols(SEXP env, SEXP lp);

/* delete a range of columns */
SEXP delCols(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* deletes a set of columns from a problem object */
SEXP delSetCols(SEXP env, SEXP lp, SEXP delstat);

/* change the linear objective coefficients */
SEXP chgObj(SEXP env, SEXP lp, SEXP ncols, SEXP ind, SEXP val);

/* get the linear objective coefficients */
SEXP getObj(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* copy a name for the objective function into a problem object */
SEXP copyObjName(SEXP env, SEXP lp, SEXP oname);

/* access the name of the objective row of a problem object */
SEXP getObjName(SEXP env, SEXP lp);

/* change a list of matrix coefficients */
SEXP chgCoefList(SEXP env, SEXP lp, SEXP nnz, SEXP ia, SEXP ja, SEXP ar);

/* change a single coefficient in the constraint matrix */
SEXP chgCoef(SEXP env, SEXP lp, SEXP i, SEXP j, SEXP val);

/* change a single coefficient in the quadratic objective of a quadratic
   problem */
SEXP chgQPcoef(SEXP env, SEXP lp, SEXP i, SEXP j, SEXP val);

/* change a single coefficient in the constraint matrix */
SEXP getCoef(SEXP env, SEXP lp, SEXP i, SEXP j);

/* get the number of non zero elements in the constraint matrix */
SEXP getNumNnz(SEXP env, SEXP lp);

/* change the upper or lower bounds on a set of variables of a problem */
SEXP chgBnds(SEXP env, SEXP lp, SEXP ncols, SEXP ind, SEXP lu, SEXP bd);

/* change the upper and lower bounds on a set of variables of a problem */
SEXP chgColsBnds(SEXP env, SEXP lp, SEXP j, SEXP lb, SEXP ub);

/* change the upper or lower bounds on a set of variables of a problem */
SEXP tightenBnds(SEXP env, SEXP lp, SEXP ncols, SEXP ind, SEXP lu, SEXP bd);

/* change type of column (variable) */
SEXP chgColType(SEXP env, SEXP lp, SEXP ncols, SEXP ind, SEXP xctype);

/* get the types for a range of variables in a problem object */
SEXP getColType(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* can be used to copy variable type information into a given problem */
SEXP copyColType(SEXP env, SEXP lp, SEXP xctype);

/* get a range of lower bounds */
SEXP getLowerBnds(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* get a range of upper bounds */
SEXP getUpperBnds(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* get lower bounds of columns (variables) */
SEXP getLowBndsIds(SEXP env, SEXP lp, SEXP ind, SEXP ncols);

/* get upper bounds of columns (variables) */
SEXP getUppBndsIds(SEXP env, SEXP lp, SEXP ind, SEXP ncols);

/* change the right hand side coefficients of a set of linear constraints */
SEXP chgRhs(SEXP env, SEXP lp, SEXP nrows, SEXP ind, SEXP val);

/* get right hand side */
SEXP getRhs(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* change the sense of a set of linear constraints */
SEXP chgSense(SEXP env, SEXP lp, SEXP nrows, SEXP ind, SEXP sense);

/* get the sense of a set of linear constraints */
SEXP getSense(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* remove all names that have been previously assigned to rows and columns */
SEXP delNames(SEXP env, SEXP lp);

/* change the name of the current problem */
SEXP chgProbName(SEXP env, SEXP lp, SEXP probname);

/* accesses the name of the problem */
SEXP getProbName(SEXP env, SEXP lp);

/* change the name of a constraint or the name of a variable in a
   problem object */
SEXP chgName(SEXP env, SEXP lp, SEXP key, SEXP ij, SEXP name);

/* change the names of linear constraints in a problem object */
SEXP chgRowName(SEXP env, SEXP lp, SEXP nnames, SEXP ind, SEXP names);

/* change the names of variables in a problem object */
SEXP chgColName(SEXP env, SEXP lp, SEXP nnames, SEXP ind, SEXP names);

/* access a range of row names or, equivalently, the constraint names of a
   problem object */
SEXP getRowName(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* access a range of column names or, equivalently, the variable names of a */
/* problem object */
SEXP getColName(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* search for the index number of the specified column in a problem object */
SEXP getColIndex(SEXP env, SEXP lp, SEXP cname);

/* search for the index number of the specified row in a problem object */
SEXP getRowIndex(SEXP env, SEXP lp, SEXP rname);

/* change the right hand side coefficients of a set of linear constraints */
SEXP chgRngVal(SEXP env, SEXP lp, SEXP nrows, SEXP ind, SEXP val);

/* get rhs range coefficients for a set of constraints */
SEXP getRngVal(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* access a range of rows of the constraint matrix, not including the objective
   function nor the bound constraints on the variables of a problem object */
SEXP getRows(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* access a range of columns of the constraint matrix of a problem object */
SEXP getCols(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* manage modification steps closely */
SEXP completelp(SEXP env, SEXP lp);

/* change to zero any problem coefficients that are smaller in magnitude than
   the tolerance specified in the argument eps */
SEXP cleanupCoef(SEXP env, SEXP lp, SEXP eps);

/* provide starting information for use in a subsequent call
   to a simplex optimization routine  */
SEXP copyStart(SEXP env, SEXP lp,
               SEXP cstat, SEXP rstat,
               SEXP cprim, SEXP rprim,
               SEXP cdual, SEXP rdual);

/* copy a basis into a problem object */
SEXP copyBase(SEXP env, SEXP lp, SEXP cstat, SEXP rstat);

/* copy a partial basis into an LP problem object */
SEXP copyPartBase(SEXP env, SEXP lp,
                  SEXP ncind, SEXP cind, SEXP cstat,
                  SEXP nrind, SEXP rind, SEXP rstat);

/* access the basis resident in a problem object */
SEXP getBase(SEXP env, SEXP lp);

/* write the most current basis associated with a problem object to file */
SEXP baseWrite(SEXP env, SEXP lp, SEXP fname);

/* read a basis from a BAS file, and copy that basis into a problem object */
SEXP readCopyBase(SEXP env, SEXP lp, SEXP fname);

/* solve lp problem (general, use CPX_PARAM_LPMETHOD) */
SEXP lpopt(SEXP env, SEXP lp);

/* solve lp problem using primal simplex method */
SEXP primopt(SEXP env, SEXP lp);

/* solve lp problem using dual simplex method */
SEXP dualopt(SEXP env, SEXP lp);

/* solve lp problem using baropt */
SEXP baropt(SEXP env, SEXP lp);

/* solve lp problem using hybbaropt */
SEXP hybbaropt(SEXP env, SEXP lp, SEXP method);

/* solve lp problem using hybnetopt */
SEXP hybnetopt(SEXP env, SEXP lp, SEXP method);

/* solve lp problem using siftopt */
SEXP siftopt(SEXP env, SEXP lp);

/* solve lp problem using mipopt */
SEXP mipopt(SEXP env, SEXP lp);

/* solve qp problem using qpopt */
SEXP qpopt(SEXP env, SEXP lp);

/* access the MIP cutoff value being used during mixed integer optimization */
SEXP getCutoff(SEXP env, SEXP lp);

/* provide two arrays that can be used to project the impact of making changes
   to optimal variable values or objective function coefficients */
SEXP getGrad(SEXP env, SEXP lp, SEXP j);

/* access the total number of simplex iterations to solve an LP problem, or
   the number of crossover iterations in the case that the barrier optimizer
   is used */
SEXP getItCnt(SEXP env, SEXP lp);

/* access the number of Phase I iterations to solve a problem using the
   primal or dual simplex method */
SEXP getPhase1Cnt(SEXP env, SEXP lp);

/* access the total number of sifting iterations to solve an LP problem */
SEXP getSiftItCnt(SEXP env, SEXP lp);

/* access the number of Phase I sifting iterations to solve an LP problem */
SEXP getSiftPase1Cnt(SEXP env, SEXP lp);

/* access the number of dual super-basic variables in the current solution */
SEXP getDbsCnt(SEXP env, SEXP lp);

/* computes a minimum-cost relaxation of the righthand side values of
   constraints or bounds on variables in order to make an
   infeasible problem feasible */
SEXP feasOpt(SEXP env, SEXP lp, SEXP rhs, SEXP rng, SEXP lb, SEXP ub);

/* compute the infeasibility of a given solution for a range of variables */
SEXP getColInfeas(SEXP env, SEXP lp, SEXP sol, SEXP begin, SEXP end);

/* compute the infeasibility of a given solution for a range of
   linear constraints */
SEXP getRowInfeas(SEXP env, SEXP lp, SEXP sol, SEXP begin, SEXP end);

/* identify a minimal conflict for the infeasibility of the linear constraints
   and the variable bounds in the current problem */
SEXP refineConflict(SEXP env, SEXP lp);

/* identify a minimal conflict for the infeasibility of the current problem
   or a subset of constraints of the current problem */
SEXP refineConflictExt(SEXP env, SEXP lp, SEXP grpcnt, SEXP concnt,
                       SEXP grppref, SEXP grpbeg, SEXP grpind,
                       SEXP grptype);

/* return the linear constraints and variables belonging to a conflict
   previously computed by the routine CPXrefineconflict */
SEXP getConflict(SEXP env, SEXP lp);

/* get conflict status codes of the groups numbered beg (for begin) through end
   in the most recent call */
SEXP getConflictExt(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* write an LP format file containing the identified conflict */
SEXP cLpWrite(SEXP env, SEXP lp, SEXP fname);

/* free the presolved problem from the LP problem object */
SEXP freePresolve(SEXP env, SEXP lp);

/* return an integer specifying the solution algorithm used to solve the
   resident LP, QP, or QCP problem */
SEXP getMethod(SEXP env, SEXP lp);

/* access the solution method of the last subproblem optimization, in the case
   of an error termination during mixed integer optimization */
SEXP getSubMethod(SEXP env, SEXP lp);

/* get double-valued information about the quality of the current
   solution of a problem */
SEXP getDblQual(SEXP env, SEXP lp, SEXP w);

/* get integer-valued information about the quality of the current
   solution of a problem */
SEXP getIntQual(SEXP env, SEXP lp, SEXP w);

/* access solution information */
SEXP solnInfo(SEXP env, SEXP lp);

/* accesses the solution values produced by all the optimization routines
   except the routine CPXNETprimopt */
SEXP solution(SEXP env, SEXP lp);

/* write a solution file for the selected problem object */
SEXP solWrite(SEXP env, SEXP lp, SEXP fname);

/* read a solution from a SOL format file, and copies that basis or solution
   into a problem object */
SEXP readCopySol(SEXP env, SEXP lp, SEXP fname);

/* access solution status of optimizations */
SEXP getStat(SEXP env, SEXP lp);

/* access the solution status of the last subproblem optimization, in the case
   of an error termination during mixed integer optimization */
SEXP getSubStat(SEXP env, SEXP lp);

/* get solution objective value */
SEXP getObjVal(SEXP env, SEXP lp);

/* access the currently best known bound of all the remaining open nodes
   in a branch-and-cut tree */
SEXP getBestObjVal(SEXP env, SEXP lp);

/* access the relative objective gap for a MIP optimization */
SEXP getMIPrelGap(SEXP env, SEXP lp);

/* get solution values for a range of problem variables */
SEXP getProbVar(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* get slack values for a range of constraints */
SEXP getSlack(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* get dual values for a range of constraints */
SEXP getPi(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* access the reduced costs for a range of the variables of a linear
   or quadratic program */
SEXP getDj(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* access upper and lower sensitivity ranges for lower and upper variable
   bounds for a specified range of variable indices */
SEXP boundSa(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* access upper and lower sensitivity ranges for objective function
   coefficients for a specified range of variable indices */
SEXP objSa(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* access upper and lower sensitivity ranges for righthand side values of
   a range of constraints */
SEXP rhsSa(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* open a file */
SEXP cplexfopen(SEXP fname, SEXP ftype, SEXP ptrtype);

/* close a file */
SEXP cplexfclose(SEXP cpfile);

/* write to file */
SEXP fileput(SEXP cpfile, SEXP stuff);

/* modify log file */
SEXP setLogFile(SEXP env, SEXP cpfile);

/* access log file */
SEXP getLogFile(SEXP env, SEXP ptrtype);

/* obtain pointers to the four default channels */
SEXP getChannels(SEXP env, SEXP ptrtype);

/* flush the output buffers of the four standard channels */
SEXP flushStdChannels(SEXP env);

/* instantiate a new channel object */
//SEXP addChannel(SEXP env, SEXP ptrtype);

/* flush all message destinations for a channel, ... */
//SEXP delChannel(SEXP env, SEXP newch);

/* flush all message destinations associated with a channel */
SEXP disconnectChannel(SEXP env, SEXP newch);

/* flush all message destinations associated with a channel */
SEXP flushChannel(SEXP env, SEXP newch);

/* add a file to the list of message destinations for a channel */
SEXP addFpDest(SEXP env, SEXP newch, SEXP cpfile);

/* remove a file to the list of message destinations for a channel */
SEXP delFpDest(SEXP env, SEXP newch, SEXP cpfile);

/* This routine returns a time stamp */
SEXP getTime(SEXP env);

/* tune the parameters of the environment for improved optimizer performance on
   the specified problem object */
SEXP tuneParam(SEXP env, SEXP lp,
               SEXP nIntP, SEXP intP, SEXP intPv,
               SEXP nDblP, SEXP dblP, SEXP dblPv,
               SEXP nStrP, SEXP strP, SEXP strPv);

/* set termination signal */
SEXP setTerminate(SEXP env, SEXP ptrtype);

/* release termination signal */
SEXP delTerminate(SEXP env, SEXP tsig);

/* change termination signal */
SEXP chgTerminate(SEXP env, SEXP tval);

/* print termination signal */
SEXP printTerminate(SEXP env);

/* add multiple MIP starts to a CPLEX problem object */
SEXP addMIPstarts(SEXP env, SEXP lp, SEXP mcnt, SEXP nzcnt,
                  SEXP beg, SEXP varindices, SEXP values,
                  SEXP effortlevel, SEXP cmipstartname);

/* modify or extend multiple MIP starts */
SEXP chgMIPstarts(SEXP env, SEXP lp, SEXP mcnt, SEXP mipstartindices,
                  SEXP nzcnt, SEXP beg, SEXP varindices,
                  SEXP values, SEXP effortlevel);

/* access a range of MIP starts of a CPLEX problem object */
SEXP getMIPstarts(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* access the number of MIP starts in the CPLEX problem object */
SEXP getNumMIPstarts(SEXP env, SEXP lp);

/* delete a range MIP starts */
SEXP delMIPstarts(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* write a range of MIP starts of a CPLEX problem object to a file
   in MST format */
SEXP writeMIPstarts(SEXP env, SEXP lp, SEXP fname, SEXP begin, SEXP end);

/* read a file in the format MST and copy the information of all the MIP starts
   contained in that file into a CPLEX problem object */
SEXP readCopyMIPstarts(SEXP env, SEXP lp, SEXP fname);

/* access a range of names of MIP starts */
SEXP getMIPstartName(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* search for the index number of the specified MIP start */
SEXP getMIPstartIndex(SEXP env, SEXP lp, SEXP iname);

/* refine a conflict in order to determine why a given MIP start is not
   feasible */
SEXP refineMIPstartConflict(SEXP env, SEXP lp, SEXP mipstartindex);

/* identify a minimal conflict for the infeasibility of the MIP start or a
   subset of the constraints in the model */
SEXP refineMIPstartConflictExt(SEXP env, SEXP lp, SEXP mipstartindex,
                               SEXP grpcnt, SEXP concnt, SEXP grppref,
                               SEXP grpbeg, SEXP grpind, SEXP grptype);

/* return the number of nonzeros in the Q matrix */
SEXP getNumQPnz(SEXP env, SEXP lp);

/* return the number of variables that have quadratic objective coefficients */
SEXP getNumQuad(SEXP env, SEXP lp);

/* access the quadratic coefficient in the matrix Q */
SEXP getQPcoef(SEXP env, SEXP lp, SEXP i, SEXP j);

/* access a range of columns of the matrix Q of a model with a quadratic
   objective function */
SEXP getQuad(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* copy a priority order to a CPLEX problem object */
SEXP copyOrder(SEXP env, SEXP lp, SEXP cnt, SEXP ind, SEXP prior, SEXP dir);

/* access all the MIP priority order information */
SEXP getOrder(SEXP env, SEXP lp);

/* write a priority order to an ORD file */
SEXP ordWrite(SEXP env, SEXP lp, SEXP fname);

/* read ORD file and copy priority order information into a problem object */
SEXP readCopyOrder(SEXP env, SEXP lp, SEXP fname);

/* get number of quadratic constraint of a specified CPLEX problem object */
SEXP getNumQConstrs(SEXP env, SEXP lp);

/* add quadratic constraint to a specified CPLEX problem object */
SEXP addQConstr(SEXP env, SEXP lp, SEXP lzn, SEXP qzn,
                SEXP rhs, SEXP sense,
                SEXP lind, SEXP lval,
                SEXP qrow, SEXP qcol, SEXP qval, SEXP qname);

/* delete a range of quadratic constraints */
SEXP delQConstrs(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* access a quadratic constraint on the variables of a problem object */
SEXP getQConstr(SEXP env, SEXP lp, SEXP which);

/* add an indicator constraint to the specified problem object */
SEXP addIndConstr(SEXP env, SEXP lp, SEXP indvar, SEXP complemented,
                  SEXP nzcnt, SEXP rhs, SEXP sense, SEXP linind, SEXP linval,
                  SEXP indname);

/* delete a range of indicator constraints */
SEXP delIndConstrs(SEXP env, SEXP lp, SEXP begin, SEXP end);

/* access an indicator constraint on the variables of a problem object */
SEXP getIndConstr(SEXP env, SEXP lp, SEXP which);

/* new in CPLEX 12.8.0 begin */
/* sets and opens a log file */
SEXP setLogFileName(SEXP env, SEXP filename, SEXP mode);

/* get the name of the current logfile */
SEXP getLogFileName(SEXP env);
/* new in CPLEX 12.8.0 end */

/* new in CPLEX 12.9.0 begin */
/* get CPLEX parameter hierarchy name */
SEXP getParmHierName(SEXP env, SEXP whichparam);
/* new in CPLEX 12.9.0 end */
