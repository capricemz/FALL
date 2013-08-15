package com.util
{
	import flash.display.Sprite;
	
	/**
	 * 显示层类
	 * @author mz
	 */	
	public class Layers extends Sprite
	{
		private static var _inst:Layers;
		
		public static function get inst():Layers
		{
			if(!_inst)
				_inst = new Layers(hiddle);
			return _inst
		}
		private static function hiddle():void{};
		
		/**主显示层*/
		public var layerMain:Sprite;
		/**工具提示层*/
		public var layerToolTips:Sprite;
		/**弹出提示框层*/
		public var layerTipBox:Sprite;
		
		public function Layers(fun:Function)
		{
			super();
			if(fun != hiddle)
				throw new Error("只能用getInst()来获取实例");
			layerMain = new Sprite();
			layerMain.mouseEnabled = false;
			layerMain.tabEnabled = false;
			addChild(layerMain);
			layerToolTips = new Sprite();
			layerToolTips.mouseEnabled = false;
			layerToolTips.tabEnabled = false;
			addChild(layerToolTips);
			layerTipBox = new Sprite();
			layerTipBox.mouseEnabled = false;
			layerTipBox.tabEnabled = false;
			addChild(layerTipBox);
		}
	}
}