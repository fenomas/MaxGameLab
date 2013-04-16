package com.hsharma.hungryHero.gameElements
{
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.geom.Vector3D;
	
	import away3d.containers.View3D;
	import away3d.entities.Mesh;
	import away3d.lights.PointLight;
	import away3d.materials.ColorMaterial;
	import away3d.materials.TextureMaterial;
	import away3d.materials.lightpickers.StaticLightPicker;
	import away3d.primitives.SphereGeometry;
	import away3d.textures.BitmapTexture;

	public class GameBackground3D
	{
		// a reference to the game's Away3D view
		private var view:View3D;
		private var _gamePaused:Boolean;
		private var _state:int;
		private var _speed:Number = 0;

		private var NUM_ASTEROIDS:int = 100;
		private var asteroids:Vector.<Mesh>;
		private var asteroidParallax:Number = 0.3;
		private var light:PointLight;
		
		
		public function GameBackground3D()
		{
			
		}
		
		public function init():void {
			// get a reference to the Away3D instance's view
			view = HungryHero.away3Dview;
			
			// populate scene with asteroids
			createAsteroidsAndLight();
			
			// back up camera in the Z plane and point it at the origin
			view.camera.z = -1000;
			view.camera.lookAt( new Vector3D() );
			
			// add listener to scroll astroids around each frame
			view.addEventListener(Event.ENTER_FRAME, onFrame);
		}
		
		private function createAsteroidsAndLight():void
		{
			// light has to come first, so materials can reference it
			light = new PointLight();
			light.specular = 0;
			light.ambient = 0.02;
			light.diffuse = 0.7;
			
			// make light shine from the user's upper middle-right
			light.x = 300;
			light.y = 500;
			light.z = -500;
			
			// light pickers decide which materials are affected by which lights
			var picker:StaticLightPicker = new StaticLightPicker( [light] );
			view.scene.addChild(light);
			
			// material - for simplicity, use some simple black and white perlin noise
			var texture:BitmapData = new BitmapData(128, 128, false, 0);
			texture.perlinNoise( 50, 50, 3, 42, true, true, 1, true );
			var matl:TextureMaterial = new TextureMaterial( new BitmapTexture(texture));
			matl.lightPicker = picker;
			
			// now create a bunch of spherical meshes
			asteroids = new Vector.<Mesh>;
			
			while (asteroids.length < NUM_ASTEROIDS) {
				// random size
				var s:Number = 20 + 50*Math.random();
				
				// create spherical mesh with perlin texture
				var mesh:Mesh = new Mesh( new SphereGeometry( s,6,6), matl );
				asteroids.push( mesh );
				
				// randomize position, rotation speeds, etc.
				randomizeAsteroid(mesh);
				
				// add mesh to scene
				view.scene.addChild(mesh);
			}
		}
		
		protected function randomizeAsteroid(mesh:Mesh):void {
			mesh.x = -1500 + 3000*Math.random();
			mesh.y = -150 + 1000*Math.random();
			mesh.z = 500 + 500*Math.random();
			
			mesh.extra = {};
			mesh.extra.x = Math.random();
			mesh.extra.y = Math.random();
			mesh.extra.z = Math.random();
		}
		
		protected function onFrame(event:Event):void
		{
			if (_gamePaused) { return; }
			
			if (asteroids) {
				for (var i:int=0; i<asteroids.length; i++) {
					var mesh:Mesh = asteroids[i];
					mesh.rotationX += mesh.extra.x as Number;
					mesh.rotationY += mesh.extra.y as Number;
					mesh.rotationZ += mesh.extra.z as Number;
					
					mesh.x -= _speed * asteroidParallax;
					if (mesh.x < -1500) {
						mesh.x = 1500;
					}
				}
			}
		}
		
		public function dispose():void {
			// dispose of 3D objects when game screen ends
			if (asteroids) {
				while(asteroids.length > 0) {
					var mesh:Mesh = asteroids.pop();
					view.scene.removeChild(mesh);
					mesh.dispose();
					mesh = null;
				}
				asteroids = null;
			}
			if (light) {
				view.scene.removeChild(light);
				light.dispose();
				light = null;
			}
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