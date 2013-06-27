package GameItem
{
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2Shape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2World;
	
	import flash.display.MovieClip;

	public class Ground
	{
		public function Ground(world:b2World,info:MovieClip)
		{
			var df:b2BodyDef=new b2BodyDef;
			df.type=b2Body.b2_staticBody;
			df.position.Set(info.x/30,info.y/30);
			var body:b2Body=world.CreateBody(df);
			var shape:b2PolygonShape=new b2PolygonShape;
			shape.SetAsBox(info.width/30/2,info.height/30/2);
//			trace("w:"+info.shape_w+"    h:"+info.shape_h);
			body.CreateFixture2(shape,1);
			body.SetAngle(info.rotation*Math.PI/180);
		}
	}
}