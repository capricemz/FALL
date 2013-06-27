package com.main
{
	import com.framework.ModuleControl;
	import com.framework.ModuleIds;
	import com.framework.MsgIds;

	/**
	 * 启动相关处理类
	 * @author mz
	 */	
	public class MainHandle
	{
		public function MainHandle()
		{
			
		}
		/**启动游戏*/
		public function start():void
		{
			var moduleCtrl:ModuleControl = ModuleControl.getInstance();
			trace("游戏启动。。。");
			
			trace("引擎模块初始化");
			moduleCtrl.callModule(ModuleIds.ENGINE,MsgIds.ENGINE_INIT);
			
		}
	}
}