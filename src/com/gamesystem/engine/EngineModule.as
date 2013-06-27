package com.gamesystem.engine
{
	import com.framework.BasicModule;
	import com.framework.MsgIds;
	
	import flash.utils.ByteArray;
	
	/**
	 * 引擎模块接口类
	 * @author mz
	 */	
	public class EngineModule extends BasicModule
	{
		override public function handle(msgId:int, msg:ByteArray):void
		{
			switch (msgId)
			{
				case MsgIds.ENGINE_INIT:
					var box2d_engine:Box2DEngine = new Box2DEngine();
					box2d_engine.startEngine();
					break;
			}
		}
	}
}