package com.gamesystem.engine
{
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2Fixture;
	
	import com.gamesystem.engine.I_Fs.IStuff;
	import com.gamesystem.engine.I_Fs.IUserData;
	import com.util.Layers;
	
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * Box2D引擎类
	 * @author Administrator
	 */	
	public class Box2DEngine
	{
		private var theBox2D:InitBox2D;
		/**box2d初始化相关*/
		private var timeStep:Number = 1/30,velocityInterations:int = 20,positionIterations:int = 20;
		/**刷新器*/
		private var timer:Timer,delay:Number;
		
		public function Box2DEngine()
		{
			super();
			
			theBox2D = InitBox2D.getInst();
			theBox2D.creatWorld();
			if(EngineConsts.isDebugDrawShow)
				Layers.inst.layerMain.addChild(theBox2D.getDebugDraw());
			
			delay = 1000*timeStep;
			timer = new Timer(delay);
			timer.addEventListener(TimerEvent.TIMER,handleTimer);
		}
		/**更新处理*/
		protected function handleTimer(event:TimerEvent):void
		{
			theBox2D.world.Step(timeStep,velocityInterations,positionIterations);
			theBox2D.world.ClearForces();//在2.1版本清除力，以提高效率
			if(EngineConsts.isDebugDrawShow)
				theBox2D.world.DrawDebugData();//绘制
			//刷新
			var b:b2Body = theBox2D.world.GetBodyList();
			while(b)
			{
				var _b:b2Body = b;
				b = b.GetNext();
				var stuff:IStuff = _b.GetUserData();
				if(stuff)
					stuff.update();
			}
		}
		private var hasMouseJoint:Boolean;
		/**
		 * 鼠标控制刚体开关
		 * @param boolean 默认执行开启
		 */		
		public function mouseJointSwitch(boolean:Boolean = true):void
		{
			if(boolean)
			{
				Layers.inst.layerMain.addEventListener(MouseEvent.MOUSE_DOWN,onDown);
				Layers.inst.layerMain.addEventListener(MouseEvent.MOUSE_UP,onUp);
			}
			else
			{
				Layers.inst.layerMain.removeEventListener(MouseEvent.MOUSE_DOWN,onDown);
				Layers.inst.layerMain.removeEventListener(MouseEvent.MOUSE_UP,onUp);
				Layers.inst.layerMain.removeEventListener(MouseEvent.MOUSE_MOVE,onMove);
			}
		}
		protected function onDown(event:MouseEvent):void
		{
			event.stopPropagation();
			if(hasMouseJoint)
				return;
			var fun:Function = function (fixture:b2Fixture):void
			{
				if(fixture)
				{
					theBox2D.createMouseJoint(fixture.GetBody(),event.stageX,event.stageY);
					Layers.inst.layerMain.addEventListener(MouseEvent.MOUSE_MOVE,onMove);
				}
			};
			theBox2D.toQueryPoint(fun,event.stageX,event.stageY);
			hasMouseJoint = true;
		}
		protected function onUp(event:MouseEvent):void
		{
			event.stopPropagation();
			if(!hasMouseJoint)
				return;
			Layers.inst.layerMain.removeEventListener(MouseEvent.MOUSE_MOVE,onMove);
			theBox2D.destroyMouseJoint();
			hasMouseJoint = false;
		}
		protected function onMove(event:MouseEvent):void
		{
			event.stopPropagation();
			if(hasMouseJoint)
				theBox2D.setMouseJointTarget(event.stageX,event.stageY);
		}
		/**启动引擎*/
		public function startEngine():void
		{
			timer.start();
		}
		/**暂停引擎*/
		public function stopEngine():void
		{
			timer.stop();
		}
		/**创建b2Body*/
		public function creatB2Body(userData:IUserData):void
		{
			theBox2D.creatB2Body(userData);
		}
		public function destroyB2Body(id:int):void
		{
			theBox2D.destroyB2Body(id);
		}
	}
}