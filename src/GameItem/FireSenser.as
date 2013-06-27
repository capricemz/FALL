package GameItem
{
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2Shape;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	import engine.Icontact;

	public class FireSenser implements Icontact
	{
		public function FireSenser()
		{
		}
		private var body:b2Body;
		private const r:Number=10;
		private var world:b2World;
		public function initShape($x:Number,$y:Number,$world:b2World):void
		{
			world=$world;
			var df:b2BodyDef=new b2BodyDef;
			df.type=b2Body.b2_staticBody;
			df.position.Set($x/30,$y/30);
			body=world.CreateBody(df);
			var shape:b2CircleShape=new b2CircleShape(r/30);
			var fdf:b2FixtureDef=new b2FixtureDef;
			fdf.isSensor=true;
			fdf.userData=this;
			fdf.shape=shape;
			body.CreateFixture(fdf);
		}
		private var canDestroy:Boolean=false;
		private function destroy():void
		{
			world.DestroyBody(body);
			body=null;
			world=null;
		}
		public function update():Boolean
		{
			if(canDestroy)
				destroy();
			return canDestroy;
		}
		public function getType():String
		{
			return "fire";
		}
		public function hit(type:String):void
		{
			if(type=="hero")
				canDestroy=true;
		}
	}
}