package com.framework
{
	import flash.utils.Dictionary;

	/**
	 * 模块控制类<br>
	 * 提供模块的注册、反注册及调用方法
	 * @author mz
	 */	
	public class ModuleControl
	{
		private static var singleton:ModuleControl;
		
		public static function getInstance():ModuleControl
		{
			if(singleton == null)
			{
				singleton = new ModuleControl(hidden);
			}
			return singleton;
		}
		private static function hidden():void{}
		public function ModuleControl(caller:Function)
		{
			if(caller != hidden)
				throw new Error("只能用getInstance()来获取实例");
			if(ModuleControl.singleton != null)
				throw new Error("只能用getInstance()来获取实例");
			
			dic = new Dictionary();
		}
		private var dic:Dictionary;
		/**
		 * 模块注册<br>
		 * 一个moduleId只能注册一个module
		 * @param moduleId 模块id
		 * @param module 模块
		 */		
		public function registrtModule(moduleId:int,module:IModule):void
		{
			if(dic[moduleId])//若该moduleId已注册过模块
			{
				throw new Error("该moduleId已注册过模块，请核对moduleId");
			}
			else
			{
				dic[moduleId] = module;
			}
		}
		/**
		 * 模块移除
		 * @param moduleId 模块id
		 * @param module 模块
		 */		
		public function removeModule(moduleId:int):void
		{
			if(dic[moduleId])//若该moduleId已注册过模块
			{
				dic[moduleId] = null;
			}
			else
			{
				throw new Error("该moduleId未注册过模块，请核对moduleId");
			}
		}
		/**
		 * 调用moduleId对应的模块对
		 * @param moduleId
		 * @param msgId
		 * @param msg
		 */		
		public function callModule(moduleId:int,msgId:int = 0,msg:* = null):void
		{
			if(dic[moduleId])//若该moduleId已注册过模块
			{
				var iModule:IModule = dic[moduleId];
				iModule.handle(msgId,msg);
			}
			else
			{
				throw new Error("该moduleId未注册过模块，请核对moduleId");
			}
		}
		
	}
}