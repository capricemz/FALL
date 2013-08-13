package com.gamesystem.engine
{
	/**
	 * Box2D常量定义类
	 * @author Administrator
	 */	
	public class EngineConsts
	{
		public static const isDebugDrawShow:Boolean = true;
		
		public static const P2M:int = 30;
		
		public static const categotybits_1:uint = 1<<0;
		public static const categotybits_2:uint = 1<<1;
		//……
		
		public static const maskbits_1:uint = categotybits_1 + categotybits_2;
		public static const maskbits_2:uint = categotybits_1;
		
		/**鼠标关节id*/
		public static const mouseJoint:int = 1315211905;
	}
}