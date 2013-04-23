/*
** ADOBE SYSTEMS INCORPORATED
** Copyright 2012 Adobe Systems Incorporated
** All Rights Reserved.
**
** NOTICE:  Adobe permits you to use, modify, and distribute this file in accordance with the
** terms of the Adobe license agreement accompanying it.  If you have received this file from a
** source other than Adobe, then your use, modification, or distribution of it requires the prior
** written permission of Adobe.
*/
#include "pathfinder.h"
#include "AS3/AS3.h"

// First we mark the function declaration with a GCC attribute specifying the
// AS3 signature

////** flascc_createPather **////
void flascc_createPather() __attribute__((used,
	annotate("as3sig:public function flascc_createPather():int"),
	annotate("as3package:com.renaun.flascc_interface")));

void flascc_createPather()
{
    // Create an instance of the Class
    Pather *result;
    result = (Pather *)new Pather();
    
    // Create int for the pointer into memory for this object instance
    AS3_DeclareVar(asresult, int);
    AS3_CopyScalarToVar(asresult, result);
    
    // return the pointer value of this object in memory
    AS3_ReturnAS3Var(asresult);
}

////** flascc_deletePather **////
void flascc_deletePather() __attribute__((used,
      annotate("as3sig:public function flascc_deletePather(self):void"),
      annotate("as3package:com.renaun.flascc_interface")));

void flascc_deletePather()
{
    Pather *arg1 = (Pather *) 0 ;
    AS3_GetScalarFromVar(arg1, self);
    delete arg1;
    AS3_ReturnAS3Var(undefined);
}

////** flascc_set_x **////
void flascc_set_x() __attribute__((used,
        annotate("as3sig:public function flascc_set_x(self, x:Number):void"),
        annotate("as3package:com.renaun.flascc_interface")));

void flascc_set_x()
{
    Pather *arg1 = (Pather *) 0 ;
    double arg2 ;
    // convert arguments
    AS3_GetScalarFromVar(arg1, self);
    AS3_GetScalarFromVar(arg2, x);
    // apply to object
    if (arg1) (arg1)->x = arg2;
    // return void
    AS3_ReturnAS3Var(undefined);
}


////** flascc_get_x **////
void flascc_get_x() __attribute__((used,
    annotate("as3sig:public function flascc_get_x(self):Number"),
    annotate("as3package:com.renaun.flascc_interface")));

void flascc_get_x()
{
    Pather *arg1 = (Pather *) 0 ;
    double result ;
    // convert arguments
    AS3_GetScalarFromVar(arg1, self);
    // apply to object
    result = (double) ((arg1)->x);
    // return Number
    AS3_DeclareVar(asresult, Number);
    AS3_CopyScalarToVar(asresult, result);
    AS3_ReturnAS3Var(asresult);
}

////** flascc_set_y **////
void flascc_set_y() __attribute__((used,
     annotate("as3sig:public function flascc_set_y(self, y:Number):void"),
     annotate("as3package:com.renaun.flascc_interface")));

void flascc_set_y()
{
    Pather *arg1 = (Pather *) 0 ;
    double arg2 ;
    // convert arguments
    AS3_GetScalarFromVar(arg1, self);
    AS3_GetScalarFromVar(arg2, y);
    // apply to object
    if (arg1) (arg1)->y = arg2;
    // return void
    AS3_ReturnAS3Var(undefined);
}

////** flascc_get_y **////
void flascc_get_y() __attribute__((used,
      annotate("as3sig:public function flascc_get_y(self):Number"),
      annotate("as3package:com.renaun.flascc_interface")));

void flascc_get_y()
{
    Pather *arg1 = (Pather *) 0 ;
    double result ;
    // convert arguments
    AS3_GetScalarFromVar(arg1, self);
    // apply to object
    result = (double) ((arg1)->y);
    // return Number
    AS3_DeclareVar(asresult, Number);
    AS3_CopyScalarToVar(asresult, result);
    AS3_ReturnAS3Var(asresult);
}

////** flascc_move **////
void flascc_move() __attribute__((used,
     annotate("as3sig:public function flascc_move(self, dx:int, dy:int):void"),
     annotate("as3package:com.renaun.flascc_interface")));

void flascc_move()
{
    Pather *arg1 = (Pather *) 0 ;
    int arg2 ;
    int arg3 ;
    // convert arguments
    AS3_GetScalarFromVar(arg1, self);
    AS3_GetScalarFromVar(arg2, dx);
    AS3_GetScalarFromVar(arg3, dy);
    // apply to object
    (arg1)->move(arg2,arg3);
    // return void
    AS3_ReturnAS3Var(undefined);
}

