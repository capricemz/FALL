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
			//相关模块初始化
			moduleCtrl.callModule(ModuleIds.ENGINE,MsgIds.ENGINE_INIT);
			trace("引擎模块初始化完成");
			moduleCtrl.callModule(ModuleIds.TIME,MsgIds.TIME_INIT);
			trace("时间模块初始化完成");
			moduleCtrl.callModule(ModuleIds.SCENE,MsgIds.SCENE_INIT);
			trace("场景模块初始化完成");
			moduleCtrl.callModule(ModuleIds.STUFF,MsgIds.STUFF_INIT);
			trace("生物模块初始化完成");
			moduleCtrl.callModule(ModuleIds.PLOT,MsgIds.PLOT_INIT);
			trace("剧情模块初始化完成");
			//相关模块构建
			moduleCtrl.callModule(ModuleIds.SCENE,MsgIds.SCENE_BUILDING);
			trace("初始场景构建完成");
			moduleCtrl.callModule(ModuleIds.STUFF,MsgIds.STUFF_BUILDING);
			trace("初始生物构建完成");
			//启动游戏
			moduleCtrl.callModule(ModuleIds.ENGINE,MsgIds.ENGINE_START);
			trace("游戏启动完成");
		}
	}
}