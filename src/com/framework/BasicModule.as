package com.framework
{
	import com.util.Connect;
	
	import flash.utils.ByteArray;
	
	/**
	 * 基础模块接口实现类
	 * @author mz
	 */	
	public class BasicModule implements IModule
	{
		protected var moduleCtrl:ModuleControl;
		protected var connect:Connect;
		
		public function BasicModule()
		{
			moduleCtrl = ModuleControl.getInstance();
			connect = Connect.getInstance();
		}
		
		public function handle(msgId:int, msg:*):void
		{
		}
	}
}