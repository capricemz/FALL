package com.gamesystem.scene
{
	/**
	 * 场景控制类
	 * @author mz
	 */	
	public class SceneC
	{
		private var model:SceneM;
		
		public function SceneC(model:SceneM)
		{
			this.model = model;
		}
		
		
		/**清理资源释放内存*/		
		public function unSceneC():void
		{
			
		}
	}
}