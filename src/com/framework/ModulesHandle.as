package com.framework
{
	import com.gamesystem.stuff.StuffModule;
	import com.gamesystem.engine.EngineModule;
	import com.gamesystem.plot.PlotModule;
	import com.gamesystem.scene.SceneModule;
	import com.gamesystem.time.TimeModule;
	import com.main.MainModule;
	

	/**
	 * 模块注册移除处理类<br>
	 * 用于对消息进行模块注册或删除
	 * @author mz
	 */	
	public class ModulesHandle
	{
		private var moduleCtrl:ModuleControl;
		private var mainModule:MainModule,engineModule:EngineModule,timeModule:TimeModule,sceneModule:SceneModule,
		stuffModule:StuffModule,plotModule:PlotModule;
		
		public function ModulesHandle()
		{
			moduleCtrl = ModuleControl.getInstance();
			mainModule = new MainModule();
			engineModule = new EngineModule();
			timeModule = new TimeModule();
			sceneModule = new SceneModule();
			stuffModule = new StuffModule();
			plotModule = new PlotModule();
		}
		/**
		 * 注册所有的模块
		 */		
		public function registerAll():void
		{
			moduleCtrl.registrtModule(ModuleIds.MAIN,mainModule);
			moduleCtrl.registrtModule(ModuleIds.ENGINE,engineModule);
			moduleCtrl.registrtModule(ModuleIds.TIME,timeModule);
			moduleCtrl.registrtModule(ModuleIds.SCENE,sceneModule);
			moduleCtrl.registrtModule(ModuleIds.STUFF,stuffModule);
			moduleCtrl.registrtModule(ModuleIds.PLOT,plotModule);
		}
	}
}