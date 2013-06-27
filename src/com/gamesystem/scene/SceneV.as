package com.gamesystem.scene
{
	import flash.display.Sprite;

	/**
	 * 场景界面类
	 * @author mz
	 */	
	public class SceneV
	{
		private var model:SceneM;
		private var back:Sprite;
		
		public function SceneV(model:SceneM)
		{
			this.model = model;
			back = new Sprite();
			back.graphics.beginFill(0x000000);
			back.graphics.drawRect(0,0,800,600);
			back.graphics.endFill();
		}
		/**显示场景*/
		public function show():void
		{
			var a:int = 1;
		}
		
		/**清理资源释放内存*/		
		public function unSceneV():void
		{
			
		}
	}
}