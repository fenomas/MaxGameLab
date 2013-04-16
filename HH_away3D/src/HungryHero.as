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

package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import away3d.containers.View3D;
	import away3d.core.managers.Stage3DManager;
	import away3d.core.managers.Stage3DProxy;
	import away3d.events.Stage3DEvent;
	
	import starling.core.Starling;
	
	/**
	 * SWF meta data defined for iPad 1 & 2 in landscape mode. 
	 */	
	[SWF(frameRate="60", width="1024", height="768", backgroundColor="0x000000")]
	
	/**
	 * This is the main class of the project. 
	 * 
	 * @author hsharma
	 * 
	 */
	public class HungryHero extends Sprite
	{
		/** Starling object. */
		private var myStarling:Starling;
		
		/* Away3D properties */
		private var stage3Dmanager:Stage3DManager;
		private var stage3Dproxy:Stage3DProxy;
		
		// the view3D is made public and static so it can be easily called from 
		// the BgLayer3D class. In a real game you'd probably want to pass 
		// proper references and not use a global accessor this way.
		public static var away3Dview:View3D;
		
		
		public function HungryHero()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		/**
		 * On added to stage. 
		 * @param event
		 * 
		 */
		protected function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			// stage3Dmanager is a singleton that provides the stage3D proxy
			stage3Dmanager = Stage3DManager.getInstance(stage);
			
			// Initialize Stage3D proxy to hold views for both Away3D and Starling
			stage3Dproxy = stage3Dmanager.getFreeStage3DProxy();
			
			// defer more initialization until after Stage3D context is created
			stage3Dproxy.addEventListener(Stage3DEvent.CONTEXT3D_CREATED, onContextCreated);
			
			// Define basic anti aliasing.
			stage3Dproxy.antiAlias = 1;
		}
			
		
		/**
		 * On Stage3D context created
		 * @param event
		 * 
		 */
		protected function onContextCreated(event:Stage3DEvent):void
		{	
			// Initialize Starling object, passing it a Stage3D proxy to render into
			myStarling = new Starling(Game, stage, stage3Dproxy.viewPort, stage3Dproxy.stage3D);
			
			// Show statistics for memory usage and fps.
			myStarling.showStats = true;
			
			// Position stats.
			myStarling.showStatsAt("left", "bottom");
			
			// Start Starling Framework.
			myStarling.start();
			
			// Also initialize an Away3D object, which will hold the Away3D background layer.
			away3Dview = new View3D;
			away3Dview.stage3DProxy = stage3Dproxy;
			away3Dview.shareContext = true;
			
			// add Away3D's view (which contains its managed Stage3D instance) to the stage
			addChild(away3Dview);
			away3Dview.render();
			
			// create a frame event listener to render Starling each frame
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		protected function onEnterFrame(event:Event):void
		{
			// With Away3D and Starling sharing a Stage3D context, the game must
			// manually clear the context and call each framework's render.
			// In this way you can control the stacking order of each framework's content.
			stage3Dproxy.clear();
			
			// render the frameworks from back to front of course
			away3Dview.render();
			myStarling.nextFrame();
			
			// and finally present to the GPU
			stage3Dproxy.present();
			
		}
	}
}