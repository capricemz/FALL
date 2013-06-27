package com.gamesystem.stuff
{
	import com.framework.IModule;
	
	import flash.utils.ByteArray;
	
	/**
	 * 事物模块接口类
	 * @author mz
	 */	
	public class StuffModule implements IModule
	{
		public function StuffModule()
		{
		}
		
		public function handle(msgId:int, msg:ByteArray):void
		{
			switch (msgId)
			{
				case 1:
					break;
			}
		}
	}
}