package com.util
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	/**
	 * 显示层类
	 * @author mz
	 */	
	public class Layers extends DisplayObjectContainer
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
		public var layerMain:DisplayObjectContainer;
		/**工具提示层*/
		public var layerToolTips:DisplayObjectContainer;
		/**弹出提示框层*/
		public var layerTipBox:DisplayObjectContainer;
		
		public function Layers(fun:Function)
		{
			super();
			if(fun != hiddle)
				throw new Error("只能用getInst()来获取实例");
			layerMain = new DisplayObjectContainer();
			addChild(layerMain);
			layerToolTips = new DisplayObjectContainer();
			layerToolTips.mouseEnabled = false;
			addChild(layerToolTips);
			layerTipBox = new DisplayObjectContainer();
			layerTipBox.mouseEnabled = false;
			addChild(layerTipBox);
		}
	}
}