package com.hsharma.hungryHero.gameElements
{
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	import away3d.containers.View3D;
	import away3d.entities.Mesh;
	import away3d.lights.PointLight;
	import away3d.materials.TextureMaterial;
	import away3d.materials.lightpickers.StaticLightPicker;
	import away3d.primitives.SphereGeometry;
	import away3d.textures.BitmapTexture;

	public class GameBackground3D
	{
		private var _gamePaused:Boolean;
		private var _state:int;
		private var _speed:Number = 0;
		
		// new vars added for 3D background
		private var view:View3D;
		private var asteroid:Mesh;
		private var light:PointLight;
		
		
		public function GameBackground3D()
		{
			
		}
		
		public function init():void {
			
			// get a reference to the Away3D instance's view
			view = HungryHero.away3Dview;
			
			// light has to come first, so materials can reference it
			light = new PointLight();
			light.specular = 0;
			light.ambient = 0.15;
			light.diffuse = 0.7;
			
			// make light shine from the user's upper middle-right
			light.x = 300;
			light.y = 500;
			light.z = -500;
			
			// light pickers decide which materials are affected by which lights
			var picker:StaticLightPicker = new StaticLightPicker( [light] );
			view.scene.addChild(light);
			
			
			// texture - for simplicity, use some simple black and white perlin noise
			var texture:BitmapData = new BitmapData(128, 128, false, 0);
			texture.perlinNoise( 50, 50, 3, 42, true, true, 1, true );
			
			// material to apply to mesh
			var matl:TextureMaterial = new TextureMaterial( new BitmapTexture(texture));
			
			// make this material be affected by our light
			matl.lightPicker = picker;
			
			// spehrical mesh to be an asteroid
			asteroid = new Mesh( new SphereGeometry( 200,6,6), matl );
			
			// add mesh to scene and it will show up in renders
			view.scene.addChild(asteroid);
			
			// back up camera in the Z plane and point it at the origin
			view.camera.z = -1000;
			view.camera.lookAt( new Vector3D() );
			
			// add a listener to animate the mesh
			view.addEventListener(Event.ENTER_FRAME, onFrame);
		}
		
		
		
		protected function onFrame(event:Event):void
		{
			asteroid.rotationY++;
		}
		
		
		
		
		// below are all copied from GameBackground.as
		
		/**
		 * Game paused? 
		 * @return 
		 * 
		 */
		public function get gamePaused():Boolean { return _gamePaused; }
		public function set gamePaused(value:Boolean):void { _gamePaused = value; }
		
		/**
		 *  
		 * State of the game.
		 * 
		 */
		public function get state():int { return _state; }
		public function set state(value:int):void { _state = value; }
		
		/**
		 * Speed of the hero.
		 * 
		 */
		public function get speed():Number { return _speed; }
		public function set speed(value:Number):void { _speed = value; }
		
	}
}