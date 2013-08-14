package com.framework
{
	/**
	 * 模块内消息id类
	 * @author mz
	 */	
	public class MsgIds
	{
		//引擎模块
		public static const ENGINE_INIT:int = 1000;
		public static const ENGINE_START:int = 1001;
		public static const ENGINE_STOP:int = 1002;
		public static const ENGINE_CREATE_BODY:int = 1003;
		public static const ENGINE_DESTROY_BODY:int = 1004;
		
		//时间模块
		public static const TIME_INIT:int = 2000;
		
		//场景模块
		public static const SCENE_INIT:int = 3000;
		public static const SCENE_BUILDING:int = 3001;
		public static const SCENE_RELEASE:int = 3002;
		
		//活物模块
		public static const STUFF_INIT:int = 4000;
		public static const STUFF_BUILDING:int = 4001;
		public static const STUFF_RELEASE:int = 4002;
		
		//剧情模块
		public static const PLOT_INIT:int = 5000;
	}
}