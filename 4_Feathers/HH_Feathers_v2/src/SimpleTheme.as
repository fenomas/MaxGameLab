package 
{
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
	
	import feathers.controls.renderers.BaseDefaultItemRenderer;
	import feathers.controls.renderers.DefaultListItemRenderer;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.DisplayListWatcher;
	import feathers.core.FeathersControl;
	import feathers.skins.Scale9ImageStateValueSelector;
	import feathers.textures.Scale9Textures;
	
	import starling.display.DisplayObjectContainer;

	public class SimpleTheme extends DisplayListWatcher
	{

		protected static function textRendererFactory():TextFieldTextRenderer
		{
			return new TextFieldTextRenderer();
		}

		public function SimpleTheme(root:DisplayObjectContainer)
		{
			super(root)
			this.initialize();
		}

		protected function initialize():void
		{
			FeathersControl.defaultTextRendererFactory = textRendererFactory;
			
			this.setInitializerForClass(DefaultListItemRenderer, itemRendererInitializer);
		}

		protected function itemRendererInitializer(renderer:BaseDefaultItemRenderer):void
		{
			const skinSelector:Scale9ImageStateValueSelector = new Scale9ImageStateValueSelector();
			skinSelector.defaultValue = new Scale9Textures(Assets.getAtlas().getTexture("item6"), new Rectangle(27, 0, 3, 55))
			renderer.stateToSkinFunction = skinSelector.updateValue;
			renderer.defaultLabelProperties.textFormat = new TextFormat("Arial,_sans", 32, 0x222222);
			
			renderer.paddingTop = renderer.paddingBottom = 8;
			renderer.paddingLeft = 16;
			renderer.paddingRight = 16;
			renderer.gap = 20;
		}

	}
}
