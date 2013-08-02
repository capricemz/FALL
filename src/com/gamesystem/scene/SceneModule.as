package com.gamesystem.scene
{
	import com.framework.BasicModule;
	import com.framework.ModuleIds;
	import com.framework.MsgIds;
	
	import flash.utils.ByteArray;
	
	/**
	 * 场景模块类
	 * @author mz
	 */	
	public class SceneModule extends BasicModule
	{
		public function SceneModule()
		{
			super();
		}
		override public function handle(msgId:int, msg:*):void
		{
			var model:SceneM,view:SceneV,ctrl:SceneC;
			switch (msgId)
			{
				case MsgIds.SCENE_INIT:
					model = new SceneM();
					view = new SceneV(model);
					ctrl = new SceneC(model);
					view.show();
					break;
			}
		}
	}
}