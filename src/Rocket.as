package
{
	
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2World;
	
	import GameItem.BackG;
	import GameItem.Ground;
	import GameItem.Hero;
	
	import engine.MyContact;
	
	import fla.UI;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.getTimer;
	
	[SWF(frameRate="30",width="800",height="600")]
	public class Rocket extends Sprite
	{
		private var view:Sprite;
		private var ui:UI;
		/**box2d debug渲染用*/
		private var bebug:Sprite;
		/**box2d世界*/
		private var world:b2World;
		private var de:b2DebugDraw;
		
		private var hero:Hero;
		private var lv:Level;
		
		private const timestep:Number=1/30;
		private const grivate:b2Vec2=new b2Vec2(0,10);
		private const box2dSize:int=30;
		public function Rocket()
		{
			view=new Sprite;
			addChild(view);
			ui=new UI;
			addChild(ui);
			view.addChild(new BackG);
			bebug=new Sprite;
			view.addChild(bebug);
			world=new b2World(grivate,true);
			world.SetWarmStarting(true);
			var con:MyContact=new MyContact;
			world.SetContactListener(con);
			
			de=new b2DebugDraw();
			de.SetDrawScale(box2dSize);
			de.SetSprite(bebug);
			de.SetFillAlpha(0.5);
			de.SetLineThickness(1);
			de.SetFlags(b2DebugDraw.e_centerOfMassBit|b2DebugDraw.e_shapeBit|b2DebugDraw.e_jointBit);
			world.SetDebugDraw(de);
			this.addEventListener(Event.ENTER_FRAME,rander);
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN,keyEvent);
			this.stage.addEventListener(KeyboardEvent.KEY_UP,keyEvent);
			hero=new Hero(ui);
			hero.initshape(world);
			lv=new Level(world);
		}
		
		private var is_left:Boolean,is_right:Boolean,dT:int;
		protected function keyEvent(event:KeyboardEvent):void
		{
			var b:Boolean=(event.type==KeyboardEvent.KEY_DOWN);
			switch(event.keyCode)
			{
				case Keyboard.LEFT:
					is_left=b;
					break;
				case Keyboard.RIGHT:
					is_right=b;
					break;
				case Keyboard.SPACE:
					hero.slide(b);
					if(b)
					{
						if(dT == 0)
							dT = getTimer();
					}
					else
					{
						dT = getTimer() - dT;
						if(dT < 500)
							hero.fire();
						dT = 0;
					}
					break;
				case Keyboard.UP:
					hero.is_dash=b;
					break;
			}
		}
		
		protected function rander(event:Event):void
		{
			/*if(is_left)
				hero.move(true);
			else if(is_right)
				hero.move(false);*/
			var angle:Number = Math.atan2(stage.mouseY - 300,stage.mouseX - 400);
			hero.move(angle);
			
			world.Step(timestep,10,10);
			world.ClearForces();
			world.DrawDebugData();
			hero.update(view);
			lv.update();
		}
	}
}