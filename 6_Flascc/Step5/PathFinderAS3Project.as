package
{
import com.renaun.PathFinder;
import com.renaun.flascc.CModule;

import flash.display.Sprite;
import flash.text.TextField;

public class PathFinderAS3Project extends Sprite
{
	public function PathFinderAS3Project()
	{
		CModule.startAsync(this)
		
		var tf:TextField = new TextField();
		tf.multiline = true;
		tf.width = tf.height = 600;
		addChild(tf);
		
		var pather:PathFinder = new PathFinder();
		pather.x = 10;
		pather.y = 15;
		tf.appendText("PathFinder x/y: " + pather.x + "/" + pather.y + "\n"); 
		pather.move(5, 10);
		tf.appendText("PathFinder x/y: " + pather.x + "/" + pather.y + "\n");
	}
}
}

