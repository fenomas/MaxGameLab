package com.renaun 
{

import com.renaun.flascc_interface.*;
import com.renaun.flascc.CModule;

public class PathFinder
{
	public function PathFinder():void
	{
		objectPtr = flascc_createPather();
	}
	private var objectPtr:int;
	
	public function get x():Number
	{
		return flascc_get_x(objectPtr);
	}
	public function set x(value:Number):void
	{
		flascc_set_x(objectPtr, value);
	}
	public function get y():Number
	{
		return flascc_get_y(objectPtr);
	}
	public function set y(value:Number):void
	{
		flascc_set_y(objectPtr, value);
	}
		
	public function move(dx:Number, dy:Number):void
	{
		flascc_move(objectPtr, dx, dy);
	}
	
	public function destroy():void 
	{
		flascc_deletePather(objectPtr);
	}
}
}