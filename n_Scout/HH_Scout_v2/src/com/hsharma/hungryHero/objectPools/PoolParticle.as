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
	import com.hsharma.hungryHero.gameElements.Particle;
	
	/**
	 * This class handles the Object Pooling for the Particles.
	 *  
	 * @author hsharma
	 * 
	 */
	public class PoolParticle {
		
		
		/** Function to be called when the object is to be created. */
		public var create:Function;
		
		/** Function to be called when the object is to be cleaned. */
		public var clean:Function;
		
		/** Objects in the pool. */
		private var list:Vector.<Particle> = new Vector.<Particle>();
		
		
		
		/**
		 * Object pool. 			TODO!
		 *
		 */
		
		public function PoolParticle(create:Function, clean:Function = null, minSize:int = 50, maxSize:int = 200)
		{
			this.create = create;
			this.clean = clean;
		}
		
		
		
		
		
		/**
		 * TODO
		 */
		public function checkOut():Particle
		{
			list.push( create() );
			return list[ list.length-1 ];
			
		}
		
		/**
		 * TODO
		 */
		public function checkIn(item:Particle):void
		{
			item.parent.removeChild(item);
		}
		
		
		
		
		
		
	}
}

