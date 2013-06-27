package Util
{
	import Box2D.Common.Math.b2Vec2;

	public class Common
	{
		public function Common()
		{
		}
		/**
		 * 向量旋转公式，顺时针角度为正，逆时针角度为负
		 * x1 = x0 * cosB + y0 * sinB
		
		　　y1 = -x0 * sinB + y0 * cosB*/
		public static function vectorChangeAngle(v:b2Vec2,angle:Number):b2Vec2
		{
			var v1:b2Vec2=new b2Vec2;
			v1.x=v.x*Math.cos(angle)+v.y*Math.sin(angle);
			v1.y=-v.x*Math.sin(angle)+v.y*Math.cos(angle);
			return v1;
		}
		public static const PI:Number=Math.PI;
		public static function getAngle(a:Number):Number
		{
			if(a>PI)
			{
				a=(a+PI)%(PI*2)-PI;
			}
			else if(a<-PI)
			{
				a=(a-PI)%(PI*2)+PI;
			}
			return a;
		}
	}
}