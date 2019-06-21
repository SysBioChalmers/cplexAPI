/* init.c
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

#include <R.h>
#include <Rinternals.h>

#include "cplexAPI.h"
#include "cplex_checkAPI.h"
#include "cplex_longparamAPI.h"

#include <R_ext/Rdynload.h>


static const R_CallMethodDef callMethods[] = {
    {"isCPLEXprobPtr",            (DL_FUNC) &isCPLEXprobPtr,            1},
    {"isCPLEXenvPtr",             (DL_FUNC) &isCPLEXenvPtr,             1},
    {"isCPLEXfilePtr",            (DL_FUNC) &isCPLEXfilePtr,            1},
    {"isCPLEXchanPtr",            (DL_FUNC) &isCPLEXchanPtr,            1},
    {"isCPLEXtermPtr",            (DL_FUNC) &isCPLEXtermPtr,            1},
    {"isNULLptr",                 (DL_FUNC) &isNULLptr,                 1},
    {"initCPLEX",                 (DL_FUNC) &initCPLEX,                 0},
    {"getErrorStr",               (DL_FUNC) &getErrorStr,               2},
    {"getStatStr",                (DL_FUNC) &getStatStr,                2},
    {"closeEnv",                  (DL_FUNC) &closeEnv,                  1},
    {"openEnv",                   (DL_FUNC) &openEnv,                   1},
    {"delProb",                   (DL_FUNC) &delProb,                   2},
    {"initProb",                  (DL_FUNC) &initProb,                  3},
    {"cloneProb",                 (DL_FUNC) &cloneProb,                 3},
    {"getProbType",               (DL_FUNC) &getProbType,               2},
    {"chgProbType",               (DL_FUNC) &chgProbType,               3},
    {"getVersion",                (DL_FUNC) &getVersion,                1},
    {"setDefaultParm",            (DL_FUNC) &setDefaultParm,            1},
    {"setIntParm",                (DL_FUNC) &setIntParm,                3},
    {"getIntParm",                (DL_FUNC) &getIntParm,                2},
    {"getInfoIntParm",            (DL_FUNC) &getInfoIntParm,            2},
    {"setDblParm",                (DL_FUNC) &setDblParm,                3},
    {"getDblParm",                (DL_FUNC) &getDblParm,                2},
    {"getInfoDblParm",            (DL_FUNC) &getInfoDblParm,            2},
    {"setStrParm",                (DL_FUNC) &setStrParm,                3},
    {"getStrParm",                (DL_FUNC) &getStrParm,                2},
    {"getInfoStrParm",            (DL_FUNC) &getInfoStrParm,            2},
    
    {"getParmName",               (DL_FUNC) &getParmName,               2},
    {"getParmNum",                (DL_FUNC) &getParmNum,                2},
    {"readCopyParm",              (DL_FUNC) &readCopyParm,              2},
    {"writeParm",                 (DL_FUNC) &writeParm,                 2},
    {"getParmType",               (DL_FUNC) &getParmType,               2},
    {"getChgParm",                (DL_FUNC) &getChgParm,                1},
    {"setObjDir",                 (DL_FUNC) &setObjDir,                 3},
    {"getObjDir",                 (DL_FUNC) &getObjDir,                 2},
    {"copyLp",                    (DL_FUNC) &copyLp,                   15},
    {"copyLpwNames",              (DL_FUNC) &copyLpwNames,             17},
    {"copyQuad",                  (DL_FUNC) &copyQuad,                  6},
    {"copyQPsep",                 (DL_FUNC) &copyQPsep,                 3},
    {"writeProb",                 (DL_FUNC) &writeProb,                 4},
    {"readCopyProb",              (DL_FUNC) &readCopyProb,              4},
    {"dualWrite",                 (DL_FUNC) &dualWrite,                 3},
    {"presolve",                  (DL_FUNC) &presolve,                  3},
    {"getPreStat",                (DL_FUNC) &getPreStat,                2},
    {"basicPresolve",             (DL_FUNC) &basicPresolve,             2},
    {"preslvWrite",               (DL_FUNC) &preslvWrite,               3},
    {"getRedLp",                  (DL_FUNC) &getRedLp,                  3},
    {"getObjOffset",              (DL_FUNC) &getObjOffset,              2},
    {"unscaleProb",               (DL_FUNC) &unscaleProb,               2},
    {"newRows",                   (DL_FUNC) &newRows,                   7},
    {"addRows",                   (DL_FUNC) &addRows,                  12},
    {"getNumRows",                (DL_FUNC) &getNumRows,                2},
    {"delRows",                   (DL_FUNC) &delRows,                   4},
    {"delSetRows",                (DL_FUNC) &delSetRows,                3},
    {"newCols",                   (DL_FUNC) &newCols,                   8},
    {"addCols",                   (DL_FUNC) &addCols,                  11},
    {"getNumCols",                (DL_FUNC) &getNumCols,                2},
    {"delCols",                   (DL_FUNC) &delCols,                   4},
    {"delSetCols",                (DL_FUNC) &delSetCols,                3},
    {"chgObj",                    (DL_FUNC) &chgObj,                    5},
    {"getObj",                    (DL_FUNC) &getObj,                    4},
    {"copyObjName",               (DL_FUNC) &copyObjName,               3},
    {"getObjName",                (DL_FUNC) &getObjName,                2},
    {"chgCoefList",               (DL_FUNC) &chgCoefList,               6},
    {"chgCoef",                   (DL_FUNC) &chgCoef,                   5},
    {"chgQPcoef",                 (DL_FUNC) &chgQPcoef,                 5},
    {"getCoef",                   (DL_FUNC) &getCoef,                   4},
    {"getNumNnz",                 (DL_FUNC) &getNumNnz,                 2},
    {"chgBnds",                   (DL_FUNC) &chgBnds,                   6},
    {"chgColsBnds",               (DL_FUNC) &chgColsBnds,               5},
    {"tightenBnds",               (DL_FUNC) &tightenBnds,               6},
    {"chgColType",                (DL_FUNC) &chgColType,                5},
    {"getColType",                (DL_FUNC) &getColType,                4},
    {"copyColType",               (DL_FUNC) &copyColType,               3},
    {"getLowerBnds",              (DL_FUNC) &getLowerBnds,              4},
    {"getUpperBnds",              (DL_FUNC) &getUpperBnds,              4},
    {"getLowBndsIds",             (DL_FUNC) &getLowBndsIds,             4},
    {"getUppBndsIds",             (DL_FUNC) &getUppBndsIds,             4},
    {"chgRhs",                    (DL_FUNC) &chgRhs,                    5},
    {"getRhs",                    (DL_FUNC) &getRhs,                    4},
    {"chgSense",                  (DL_FUNC) &chgSense,                  5},
    {"getSense",                  (DL_FUNC) &getSense,                  4},
    {"delNames",                  (DL_FUNC) &delNames,                  2},
    {"chgProbName",               (DL_FUNC) &chgProbName,               3},
    {"getProbName",               (DL_FUNC) &getProbName,               2},
    {"chgName",                   (DL_FUNC) &chgName,                   5},
    {"chgRowName",                (DL_FUNC) &chgRowName,                5},
    {"chgColName",                (DL_FUNC) &chgColName,                5},
    {"getRowName",                (DL_FUNC) &getRowName,                4},
    {"getColName",                (DL_FUNC) &getColName,                4},
    {"getColIndex",               (DL_FUNC) &getColIndex,               3},
    {"getRowIndex",               (DL_FUNC) &getRowIndex,               3},
    {"chgRngVal",                 (DL_FUNC) &chgRngVal,                 5},
    {"getRngVal",                 (DL_FUNC) &getRngVal,                 4},
    {"getRows",                   (DL_FUNC) &getRows,                   4},
    {"getCols",                   (DL_FUNC) &getCols,                   4},
    {"completelp",                (DL_FUNC) &completelp,                2},
    {"cleanupCoef",               (DL_FUNC) &cleanupCoef,               3},
    {"copyStart",                 (DL_FUNC) &copyStart,                 8},
    {"copyBase",                  (DL_FUNC) &copyBase,                  4},
    {"copyPartBase",              (DL_FUNC) &copyPartBase,              8},
    {"getBase",                   (DL_FUNC) &getBase,                   2},
    {"baseWrite",                 (DL_FUNC) &baseWrite,                 3},
    {"readCopyBase",              (DL_FUNC) &readCopyBase,              3},
    {"lpopt",                     (DL_FUNC) &lpopt,                     2},
    {"primopt",                   (DL_FUNC) &primopt,                   2},
    {"dualopt",                   (DL_FUNC) &dualopt,                   2},
    {"baropt",                    (DL_FUNC) &baropt,                    2},
    {"hybbaropt",                 (DL_FUNC) &hybbaropt,                 3},
    {"hybnetopt",                 (DL_FUNC) &hybnetopt,                 3},
    {"siftopt",                   (DL_FUNC) &siftopt,                   2},
    {"mipopt",                    (DL_FUNC) &mipopt,                    2},
    {"qpopt",                     (DL_FUNC) &qpopt,                     2},
    {"getCutoff",                 (DL_FUNC) &getCutoff,                 2},
    {"getGrad",                   (DL_FUNC) &getGrad,                   3},
    {"getItCnt",                  (DL_FUNC) &getItCnt,                  2},
    {"getPhase1Cnt",              (DL_FUNC) &getPhase1Cnt,              2},
    {"getSiftItCnt",              (DL_FUNC) &getSiftItCnt,              2},
    {"getSiftPase1Cnt",           (DL_FUNC) &getSiftPase1Cnt,           2},
    {"getDbsCnt",                 (DL_FUNC) &getDbsCnt,                 2},
    {"feasOpt",                   (DL_FUNC) &feasOpt,                   6},
    {"getColInfeas",              (DL_FUNC) &getColInfeas,              5},
    {"getRowInfeas",              (DL_FUNC) &getRowInfeas,              5},
    {"refineConflict",            (DL_FUNC) &refineConflict,            2},
    {"refineConflictExt",         (DL_FUNC) &refineConflictExt,         8},
    {"getConflict",               (DL_FUNC) &getConflict,               2},
    {"getConflictExt",            (DL_FUNC) &getConflictExt,            4},
    {"cLpWrite",                  (DL_FUNC) &cLpWrite,                  3},
    {"freePresolve",              (DL_FUNC) &freePresolve,              2},
    {"getMethod",                 (DL_FUNC) &getMethod,                 2},
    {"getSubMethod",              (DL_FUNC) &getSubMethod,              2},
    {"getDblQual",                (DL_FUNC) &getDblQual,                3},
    {"getIntQual",                (DL_FUNC) &getIntQual,                3},
    {"solnInfo",                  (DL_FUNC) &solnInfo,                  2},
    {"solution",                  (DL_FUNC) &solution,                  2},
    {"solWrite",                  (DL_FUNC) &solWrite,                  3},
    {"readCopySol",               (DL_FUNC) &readCopySol,               3},
    {"getStat",                   (DL_FUNC) &getStat,                   2},
    {"getSubStat",                (DL_FUNC) &getSubStat,                2},
    {"getObjVal",                 (DL_FUNC) &getObjVal,                 2},
    {"getBestObjVal",             (DL_FUNC) &getBestObjVal,             2},
    {"getMIPrelGap",              (DL_FUNC) &getMIPrelGap,              2},
    {"getProbVar",                (DL_FUNC) &getProbVar,                4},
    {"getSlack",                  (DL_FUNC) &getSlack,                  4},
    {"getPi",                     (DL_FUNC) &getPi,                     4},
    {"getDj",                     (DL_FUNC) &getDj,                     4},
    {"boundSa",                   (DL_FUNC) &boundSa,                   4},
    {"objSa",                     (DL_FUNC) &objSa,                     4},
    {"rhsSa",                     (DL_FUNC) &rhsSa,                     4},
    {"cplexfopen",                (DL_FUNC) &cplexfopen,                3},
    {"cplexfclose",               (DL_FUNC) &cplexfclose,               1},
    {"fileput",                   (DL_FUNC) &fileput,                   2},
    {"setLogFile",                (DL_FUNC) &setLogFile,                2},
    {"getLogFile",                (DL_FUNC) &getLogFile,                2},
    {"getChannels",               (DL_FUNC) &getChannels,               2},
    {"flushStdChannels",          (DL_FUNC) &flushStdChannels,          1},
/*    {"addChannel",                (DL_FUNC) &addChannel,                2},*/
/*    {"delChannel",                (DL_FUNC) &delChannel,                2},*/
    {"disconnectChannel",         (DL_FUNC) &disconnectChannel,         2},
    {"flushChannel",              (DL_FUNC) &flushChannel,              2},
    {"addFpDest",                 (DL_FUNC) &addFpDest,                 3},
    {"delFpDest",                 (DL_FUNC) &delFpDest,                 3},
    {"getTime",                   (DL_FUNC) &getTime,                   1},
    {"tuneParam",                 (DL_FUNC) &tuneParam,                11},
    {"setTerminate",              (DL_FUNC) &setTerminate,              2},
    {"delTerminate",              (DL_FUNC) &delTerminate,              2},
    {"chgTerminate",              (DL_FUNC) &chgTerminate,              2},
    {"printTerminate",            (DL_FUNC) &printTerminate,            1},
    {"addMIPstarts",              (DL_FUNC) &addMIPstarts,              9},
    {"chgMIPstarts",              (DL_FUNC) &chgMIPstarts,              9},
    {"getMIPstarts",              (DL_FUNC) &getMIPstarts,              4},
    {"getNumMIPstarts",           (DL_FUNC) &getNumMIPstarts,           2},
    {"delMIPstarts",              (DL_FUNC) &delMIPstarts,              4},
    {"writeMIPstarts",            (DL_FUNC) &writeMIPstarts,            5},
    {"readCopyMIPstarts",         (DL_FUNC) &readCopyMIPstarts,         3},
    {"getMIPstartName",           (DL_FUNC) &getMIPstartName,           4},
    {"getMIPstartIndex",          (DL_FUNC) &getMIPstartIndex,          3},
    {"refineMIPstartConflict",    (DL_FUNC) &refineMIPstartConflict,    3},
    {"refineMIPstartConflictExt", (DL_FUNC) &refineMIPstartConflictExt, 9},
    {"getNumQPnz",                (DL_FUNC) &getNumQPnz,                2},
    {"getNumQuad",                (DL_FUNC) &getNumQuad,                2},
    {"getQPcoef",                 (DL_FUNC) &getQPcoef,                 4},
    {"getQuad",                   (DL_FUNC) &getQuad,                   4},
    {"copyOrder",                 (DL_FUNC) &copyOrder,                 6},
    {"getOrder",                  (DL_FUNC) &getOrder,                  2},
    {"ordWrite",                  (DL_FUNC) &ordWrite,                  3},
    {"readCopyOrder",             (DL_FUNC) &readCopyOrder,             3},
    {"getNumQConstrs",            (DL_FUNC) &getNumQConstrs,            2},
    {"addQConstr",                (DL_FUNC) &addQConstr,               12},
    {"delQConstrs",               (DL_FUNC) &delQConstrs,               4},
    {"getQConstr",                (DL_FUNC) &getQConstr,                3},
    {"addIndConstr",              (DL_FUNC) &addIndConstr,             10},
    {"delIndConstrs",             (DL_FUNC) &delIndConstrs,             4},
    {"getIndConstr",              (DL_FUNC) &getIndConstr,              3},

/* -------------------------------------------------------------------------- */
/* check                                                                      */
/* -------------------------------------------------------------------------- */
#ifdef USE_CHECK
    {"checkCopyLp",               (DL_FUNC) &checkCopyLp,              15},
    {"checkCopyLpwNames",         (DL_FUNC) &checkCopyLpwNames,        17},
    {"checkCopyQuad",             (DL_FUNC) &checkCopyQuad,             6},
    {"checkCopyQPsep",            (DL_FUNC) &checkCopyQPsep,            3},
    {"checkAddRows",              (DL_FUNC) &checkAddRows,             12},
    {"checkAddCols",              (DL_FUNC) &checkAddCols,             11},
    {"checkChgCoefList",          (DL_FUNC) &checkChgCoefList,          6},
    {"checkCopyColType",          (DL_FUNC) &checkCopyColType,          3},
    {"checkVals",                 (DL_FUNC) &checkVals,                 6},
#endif

/* -------------------------------------------------------------------------- */
/* longparam                                                                  */
/* -------------------------------------------------------------------------- */
#if defined(CPX_VERSION) && (CPX_VERSION >= 12030000)
    {"setLongParm",               (DL_FUNC) &setLongParm,               3},
    {"getLongParm",               (DL_FUNC) &getLongParm,               2},
    {"getInfoLongParm",           (DL_FUNC) &getInfoLongParm,           2},
#endif

/* -------------------------------------------------------------------------- */
/* setLogFileName, getLogFilename                                             */
/* -------------------------------------------------------------------------- */
#if defined(CPX_VERSION) && (CPX_VERSION >= 12080000)
    {"setLogFileName",           (DL_FUNC) &setLogFileName,             3},
    {"getLogFileName",           (DL_FUNC) &getLogFileName,             1},
#endif /* defined(CPX_VERSION) && (CPX_VERSION >= 12080000) */

/* -------------------------------------------------------------------------- */
/* getParmHierName                                                            */
/* -------------------------------------------------------------------------- */
#if defined(CPX_VERSION) && (CPX_VERSION >= 12090000)
    {"getParmHierName",           (DL_FUNC) &getParmHierName,           2},
#endif /* defined(CPX_VERSION) && (CPX_VERSION >= 12090000) */
    {NULL, NULL, 0}
};

/* -------------------------------------------------------------------------- */

void R_init_cplexAPI(DllInfo *info) {
    R_registerRoutines(info, NULL, callMethods, NULL, NULL);
    R_useDynamicSymbols(info, FALSE);
}




