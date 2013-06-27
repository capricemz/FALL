package com.gamesystem.engine.I_Fs
{
	public interface Icontact
	{
		/**碰撞另一方的类型*/
		function getType():String;
		/**碰撞时调用*/
		function hit(type:String):void;
	}
}