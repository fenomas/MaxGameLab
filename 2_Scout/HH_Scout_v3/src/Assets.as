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
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.profiler.Telemetry;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	/**
	 * This class holds all embedded textures, fonts and sounds and other embedded files.  
	 * By using static access methods, only one instance of the asset file is instantiated. This 
	 * means that all Image types that use the same bitmap will use the same Texture on the video card.
	 * 
	 * @author hsharma
	 * 
	 */
	public class Assets
	{
		/**
		 * Texture Atlas 
		 */
		[Embed(source="/media/graphics/mySpritesheet.png")]
		public static const AtlasTextureGame:Class;
		
		[Embed(source="/media/graphics/mySpritesheet.xml", mimeType="application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		/**
		 * Background Assets 
		 */
		[Embed(source="/media/graphics/bgLayer1.jpg")]
		public static const BgLayer1:Class;
		
		[Embed(source="/media/graphics/bgWelcome.jpg")]
		public static const BgWelcome:Class;
		
		/**
		 * Texture Cache 
		 */
		private static var gameTextures:Dictionary = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas;
		
		/**
		 * Returns the Texture atlas instance.
		 * @return the TextureAtlas instance (there is only oneinstance per app)
		 */
		public static function getAtlas():TextureAtlas
		{
			// report span metric to Scout
			Telemetry.sendSpanMetric("Assets.getAtlas() was called ---------", marker );
			
			
			// marker for span metric
			var marker:Number = Telemetry.spanMarker;
			
			// waste time for a very short while
			var t:int = getTimer();
			while (getTimer() < t+2) { };
			
			// Or the following, for a timer in microseconds: will fail if Telemetry is not connected!
			//while(Telemetry.spanMarker < marker+100) {};
			
			
			
			if (gameTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTextureGame");
				var xml:XML = XML(new AtlasXmlGame());
				gameTextureAtlas=new TextureAtlas(texture, xml);
			}
			
			return gameTextureAtlas;
			
		}
		
		/**
		 * Returns a texture from this class based on a string key.
		 * 
		 * @param name A key that matches a static constant of Bitmap type.
		 * @return a starling texture.
		 */
		public static function getTexture(name:String):Texture
		{
			// two equivalent ways of reporting a single event to Scout
			Telemetry.sendMetric( "Assets.getTexture() was called", name );
			
			
			//trace("Assets.getTexture() was called: " + name);
			
			
			var marker:Number = Telemetry.spanMarker;
			
			// waste time for a very short while
			var t:int = getTimer();
			while (getTimer() < t+2) { };
			
			// Or the following, for a timer in microseconds: will fail if Telemetry is not connected!
			//while(Telemetry.spanMarker < marker+100) {};
			
			// report span metric to Scout
			Telemetry.sendSpanMetric("Assets.getTexture() was called ---------", marker );
			
			if (name.substr(0,1)=="B") {
				//return Texture.fromBitmapData(new BitmapData(30,30,false,0xFF0000));
			}
			
			//var bitmap:Bitmap = new Assets[name]();
			//return Texture.fromBitmap(bitmap);
			
			if (gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name]=Texture.fromBitmap(bitmap);
			}
			
			return gameTextures[name];
		}
	}
}