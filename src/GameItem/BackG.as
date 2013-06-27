package GameItem
{
	import fla.bg;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;

	
	public class BackG extends Sprite
	{
		public function BackG()
		{
			var img:Sprite=new bg;
//			img.y=-img.height;
			addChild(img);
		}
	}
}