/**
 *
 * Hungry Hero Game
 * http://www.hungryherogame.com
 * 
 * Copyright (c) 2012 Hemanth Sharma (www.hsharma.com). All rights reserved.
 * 
 * This ActionScript source code is free.
 * You can redistribute and/or modify it in accordance with the
 * terms of the accompanying Simplified BSD License Agreement.
 *  
 */

package com.hsharma.hungryHero.objectPools
{
	import com.hsharma.hungryHero.gameElements.Obstacle;
	
	/**
	 * This class handles the Object Pooling for the obstacles.
	 *  
	 * @author hsharma
	 * 
	 */
	public class PoolObstacle {
		
		
		/** Function to be called when the object is to be created. */
		public var create:Function;
		
		/** Function to be called when the object is to be cleaned. */
		public var clean:Function;
		
		/** Objects in the pool. */
		private var list:Vector.<Obstacle> = new Vector.<Obstacle>();
		
		
		
		/**
		 * Object pool. 			TODO!
		 *
		 */
		
		public function PoolObstacle(create:Function, clean:Function = null, minSize:int = 50, maxSize:int = 200)
		{
			this.create = create;
			this.clean = clean;
		}
		
		
		
		
		
		/**
		 * TODO
		 */
		public function checkOut():Obstacle
		{
			list.push( create() );
			return list[ list.length-1 ];
			
		}
		
		/**
		 * TODO
		 */
		public function checkIn(item:Obstacle):void
		{
			item.parent.removeChild(item);
		}
		
		
		
		
		
		
	}
}
