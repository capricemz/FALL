package GameItem
{
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	
	import engine.Icontact;
	
	public class WingItem implements Icontact
	{
		private var body:b2Body;
		private const b_w:int=40;
		
		public function WingItem()
		{
		}
		
		public function hit(type:String):void
		{
		}
		
		public function getType():String
		{
			return null;
		}
		public function initshape(world:b2World):void
		{
			var bdf:b2BodyDef=new b2BodyDef;
			bdf.allowSleep=false;
			bdf.bullet=true;
			bdf.type=b2Body.b2_dynamicBody;
			bdf.angularDamping=1;
			/*bdf.linearDamping=1;*/////
			bdf.position.Set(0,0);
			body=world.CreateBody(bdf);
			var fdf:b2FixtureDef=new b2FixtureDef;
			fdf.density=1.0;
			fdf.userData=this;
			var shape:b2PolygonShape=new b2PolygonShape;
			shape.SetAsBox(b_w/30,5/30);
			fdf.shape=shape;
			body.CreateFixture(fdf);
		}
	}
}