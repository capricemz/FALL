package com.util
{
	import flash.errors.IOError;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.ObjectEncoding;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	
	import com.framework.ModuleControl;
	
	/**
	 * 套接字类
	 * @author mz
	 */	
	public class Connect
	{
		private static var singleton:Connect;
		public static function getInstance():Connect
		{
			if(singleton == null)
			{
				singleton = new Connect(hidden);
			}
			return singleton;
		}
		private static function hidden():void{}
		public function Connect(caller:Function=null)
		{
			if(caller != hidden)
			{
				throw new Error("只能用getInstance()来获取实例");
			}
			if(Connect.singleton != null)
			{
				throw new Error("只能用getInstance()来获取实例");
			}
			init();
		}
		
		private var socket:Socket;
		private function init():void
		{
			socket = new Socket();
			socket.objectEncoding = ObjectEncoding.AMF3;
			socket.addEventListener(IOErrorEvent.IO_ERROR,onError);
			socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onError);
			socket.addEventListener(Event.CONNECT,onConnect);
			socket.addEventListener(ProgressEvent.SOCKET_DATA,onData);
			socket.addEventListener(Event.CLOSE,onClose);
		}
		/**socket连接错误事件处理*/
		protected function onError(event:ErrorEvent):void
		{
			trace("发生错误，错误类型："+event.type);
		}
		/**socket连接成功事件处理*/
		protected function onConnect(event:Event):void
		{
			trace("socket连接成功");
		}
		/**协议长度*/
		private var length:int;
		/**socket读取数据事件处理*/
		protected function onData(event:ProgressEvent):void
		{
			var byteArray:ByteArray;
			if(length == 0 && socket.bytesAvailable>=4)//当消息长度为0且socket的缓存区域的内容大于4个字节时
			{
				byteArray = new ByteArray();
				socket.readBytes(byteArray,0,4);//读取4个字节的信息
				length = byteArray.readInt();//读取消息长度
			}
			if(length>0 && socket.bytesAvailable>=length)//当消息长度大于0且socket缓存区域的内容大于协议长度，即消息完全收到时
			{
				byteArray.clear();
				socket.readBytes(byteArray,0,length);
				var moduleId:int = byteArray.readInt();//模块id
				var msgId:int = byteArray.readInt();//消息id
				if(byteArray.bytesAvailable)
					ModuleControl.getInstance().callModule(moduleId,msgId,byteArray);
				else
					ModuleControl.getInstance().callModule(moduleId,msgId);
				length = 0;
			}
		}
		/**socket关闭事件处理*/
		protected function onClose(event:Event):void
		{
			
		}
		public function connect(host:String,port:int):void
		{
			socket.connect(host,port);
		}
		/**发送信息*/
		public function send(msg:ByteArray):void
		{
			try
			{
				socket.writeInt(msg.length);
				socket.writeBytes(msg,0,msg.length);
				socket.flush();
			}
			catch(e:IOError)
			{}
		}
	}
}