package com.gamesystem.scene
{
	import com.util.Layers;
	
	import flash.display.GradientType;
	import flash.display.Sprite;
	import flash.geom.Matrix;

	/**
	 * 场景界面类
	 * @author mz
	 */	
	public class SceneV
	{
		private var model:SceneM;

		private var bg:Sprite;
		
		public function SceneV(model:SceneM)
		{
			this.model = model;
			drawBackground();
		}
		/**绘制显示的背景*/
		private function drawBackground():void
		{
			bg = new Sprite();
			var matrix:Matrix = new Matrix();
			matrix.translate(100,100);
			bg.graphics.beginGradientFill(GradientType.RADIAL,[0xffffff,0xffaa00],[0.3,0.2],[0,255],matrix);
			bg.graphics.drawRect(0,0,750,750);
			bg.graphics.endFill();
		}
		/**显示场景*/
		public function show():void
		{
			Layers.inst.layerMain.addChild(bg);
		}
		
		/**清理资源释放内存*/		
		public function unSceneV():void
		{
			
		}
	}
}