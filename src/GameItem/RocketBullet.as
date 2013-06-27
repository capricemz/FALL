package GameItem
{
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	
	import engine.Icontact;

	public class RocketBullet implements Icontact
	{
		private var world:b2World;
		private var body:b2Body;
		public function RocketBullet($world:b2World)
		{
			world=$world;
		}
		private var speed:int=40;
		public function initShape(p:b2Vec2,tar_a:Number):void
		{
			var df:b2BodyDef=new b2BodyDef;
			df.type=b2Body.b2_dynamicBody;
			df.position=p
			body=world.CreateBody(df);
			var fdf:b2FixtureDef=new b2FixtureDef;
			fdf.userData=this;
			var shape:b2PolygonShape=new b2PolygonShape;
			shape.SetAsBox(10/30,10/30);
			fdf.shape=shape;
			body.CreateFixture(fdf);
			body.SetLinearVelocity(new b2Vec2(speed*Math.cos(tar_a),speed*Math.sin(tar_a)));
		}
		public function getType():String
		{
			return "rocketbullet";
		}
		public function hit(type:String):void
		{
			if(type!="hero")
			{
				trace("爆炸");
			}
		}
	}
}