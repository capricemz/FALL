package com.gamesystem.engine
{
	import com.framework.BasicModule;
	import com.framework.MsgIds;
	import com.util.Layers;
	
	import flash.utils.ByteArray;
	
	/**
	 * 引擎模块接口类
	 * @author mz
	 */	
	public class EngineModule extends BasicModule
	{
		private var box2dEngine:Box2DEngine;
		
		override public function handle(msgId:int, msg:*):void
		{
			switch (msgId)
			{
				case MsgIds.ENGINE_INIT:
					box2dEngine = new Box2DEngine();
					break;
				case MsgIds.ENGINE_START:
					box2dEngine.startEngine();
					break;
				case MsgIds.ENGINE_STOP:
					box2dEngine.stopEngine();
					break;
				case MsgIds.ENGINE_CREATE_BODY:
					box2dEngine.creatB2Body(msg);
					break;
				case MsgIds.ENGINE_DESTROY_BODY:
					box2dEngine.destroyB2Body(msg);
					break;
			}
		}
	}
}