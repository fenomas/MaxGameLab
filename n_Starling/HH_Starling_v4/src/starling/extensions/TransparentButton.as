package starling.extensions
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.textures.Texture;
	import starling.utils.Color;

	public class TransparentButton extends Button
	{
		
		// cached copy of the button's texture for future use in hit tests
		private var cachedTexture:BitmapData;
		
		// cutoff alpha for hit test
		private var alphaThreshold:Number = .2;
		
		
		/*
		 *	TransparentButton
		*/
		public function TransparentButton( bitmapData:BitmapData ) {
			cachedTexture = bitmapData;
			var tex:Texture = Texture.fromBitmapData(bitmapData);
			super(tex, "", null);
		}
		
		public override function hitTest(localPoint:Point, forTouch:Boolean=false):DisplayObject {
			// fail the test if the object is invisible or not touchable
			if (forTouch && (!visible || !touchable)) { return null; }
			
			// likewise if touch is outside bounds of the object
			if (! getBounds(this).containsPoint(localPoint)) { return null; }
			
			// call a Starling helper function to find the alpha value at the event x,y
			var color:uint = cachedTexture.getPixel32(localPoint.x,localPoint.y);
			if (Color.getAlpha(color) > alphaThreshold ) {
				return this; // a hit occurred!
			} else {
				return null;
			}
		}
		
	}
}