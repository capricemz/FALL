package com.main
{
	import com.framework.BasicModule;
	
	import flash.utils.ByteArray;
	
	/**
	 * 启动模块接口类
	 * @author mz
	 */	
	public class MainModule extends BasicModule
	{
		public function MainModule()
		{
			super();
		}
		override public function handle(msgId:int, msg:ByteArray):void
		{
			var mainHandle:MainHandle = new MainHandle();
			mainHandle.start();
		}
	}
}