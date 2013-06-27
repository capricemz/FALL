package
{
	import Box2D.Dynamics.b2World;
	
	import GameItem.FireSenser;
	import GameItem.Ground;
	import GameItem.Target;
	
	import fla.info;
	import fla.info2;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;

	public class Level
	{
		private var world:b2World;
		public function Level($world:b2World)
		{
			world=$world;
			fires=new Vector.<FireSenser>;
//			initFires();
			initLevel();
		}
		private function initLevel():void
		{
			var $info:Sprite=new info;
			var item:MovieClip;
			for(var i:int=0;i<$info.numChildren;i++)
//			while($info.numChildren>0)
			{
				item=$info.getChildAt(i) as MovieClip;
				if(item.type=="ground")
				{
					new Ground(world,item);
				}
				else if(item.type=="target")
				{
					new Target(world,item);
				}
				else if(item.type=="fire")
				{
					var f:FireSenser=new FireSenser;
					f.initShape(item.x,item.y,world);
					fires.push(f);
				}
			}
		}
		private var fires:Vector.<FireSenser>;
		private const ww:int=300;
		private const hh:int=300;
		private function initFires():void
		{
			for(var i:int=0;i<200;i++)
			{
//				for(var j:int=0;j<10;j++)
//				{
					var f:FireSenser=new FireSenser;
//					f.initShape(i*ww+ww*Math.random(),j*hh+hh*Math.random(),world);
					f.initShape(i*200,Math.random()*100,world);
					fires.push(f);
//				}
			}
		}
		public function update():void
		{
			var i:int,len:int=fires.length;
			for(i=0;i<len;i++)
			{
				if(fires[i].update())
				{
					fires.splice(i,1);
					len--;
					i--;
				}
			}
		}
	}
}