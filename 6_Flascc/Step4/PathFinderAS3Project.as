package
{
import com.renaun.flascc.CModule;
import com.renaun.flascc_interface.*;

import flash.display.Sprite;
import flash.text.TextField;

public class PathFinderAS3Project extends Sprite
{
	public function PathFinderAS3Project()
	{
		CModule.startAsync(this);
		
		var tf:TextField = new TextField();
		tf.multiline = true;
		tf.width = tf.height = 600;
		addChild(tf);
		
		var patherPtr:int = flascc_createPather();
		flascc_set_x(patherPtr, 10);
		flascc_set_y(patherPtr, 15);
		tf.appendText("Pather x/y: " + flascc_get_x(patherPtr) 
															    + "/" + flascc_get_y(patherPtr)  + "\n"); 
		flascc_move(patherPtr, 5, 10);
		tf.appendText("Pather x/y: " + flascc_get_x(patherPtr) 
																+ "/" + flascc_get_y(patherPtr)  + "\n"); 
	}
}
}