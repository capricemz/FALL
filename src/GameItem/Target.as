package GameItem
{
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2World;
	
	import flash.display.MovieClip;

	public class Target
	{
		public function Target($world:b2World,info:MovieClip)
		{
			var df:b2BodyDef=new b2BodyDef;
			df.type=b2Body.b2_staticBody;
			df.position.Set(info.x/30,info.y/30);
			var body:b2Body=$world.CreateBody(df);
			var shape:b2CircleShape=new b2CircleShape(info.width/30/2);
			body.CreateFixture2(shape,1);
		}
	}
}