package GameItem
{
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Mat22;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	
	import Util.Common;
	
	import engine.Icontact;
	
	import fla.UI;
	
	import flash.display.Sprite;
	import flash.utils.setTimeout;

	public class Hero implements Icontact
	{
		private var body:b2Body;
		private var b_w:int=10;
		private var enegry:int=1000;
		private var score:int=0;
		private var ui:UI;
		private var world:b2World;
		public function Hero($ui:UI)
		{
			ui=$ui;
		}
		private function updateUI():void
		{
			ui.score.text=score.toString();
			ui.enegry.text=enegry.toString();
		}
		private var r:Number=13;
		public function fire():void
		{
//			body.ApplyImpulse(new b2Vec2(2,-r),body.GetWorldCenter());
//			body.SetPosition(new b2Vec2);
//			body.SetLinearVelocity(new b2Vec2(r*Math.cos(direct),r*Math.sin(direct)));
//			body.SetLinearVelocity(new b2Vec2(r/2,-r/2));
			if(enegry>0)
			{
				/*enegry-=100;*/
				updateUI();
				body.ApplyImpulse(new b2Vec2(r*Math.cos(direct),r*Math.sin(direct)),body.GetWorldCenter());
				/*var b:RocketBullet=new RocketBullet(world);
				b.initShape(body.GetPosition().Copy(),direct);*/
			}
		}
		public var is_dash:Boolean;
		private const power:Number=/*30*/20;
		public function dash():void
		{
//			if(enegry>0)
//			{
//				enegry--;
				body.ApplyForce(new b2Vec2(power*Math.cos(direct),power*Math.sin(direct)),body.GetWorldCenter());
//				updateUI();
//			}
		}
		public function initshape(world:b2World):void
		{
			this.world=world;
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
			shape.SetAsBox(10/30,10/30);
			fdf.shape=shape;
			body.CreateFixture(fdf);
		}
		/**速度*/
		private function get speed():b2Vec2
		{
			return body.GetLinearVelocity();
		}
		private const PI:Number=Math.PI;
		/**方向*/
		private function get direct():Number
		{
			var a:Number=body.GetAngle();
			return Common.getAngle(a);
		}
		
		/**风力*/
		private function get wind():b2Vec2
		{
			/**速度方向*/
			var va:Number=Math.atan2(speed.y,speed.x);
			/**物体朝向-速度方向-*/
			var alpha:Number=Common.getAngle(direct-va);
//			var tar:Number;
//			/**速度*/
//			if(alpha>=0)
//				tar=alpha+PI/2;
//			else
//				tar=alpha-PI/2;
//			var v:b2Vec2=Common.vectorChangeAngle(speed,-tar);
//			v.Multiply(Math.sin(Math.abs(alpha)));
			var v:b2Vec2=speed.Copy();
			var m:b2Mat22=b2Mat22.FromAngle(alpha);
			v.MulM(m);
			v.Multiply(Math.abs(Math.sin(alpha)));
			var wind_value:Number=b_w*v.LengthSquared()*mu/2;
			var tar_a:Number;
			if(alpha>=0)
				tar_a=direct+Math.PI/2;
			else
				tar_a=direct-Math.PI/2;
			var tar_v:b2Vec2=new b2Vec2(wind_value*Math.cos(tar_a),wind_value*Math.sin(tar_a));
			return tar_v;
		}
		/**滑行*/
		public function slide(b:Boolean):void
		{
			if(b)
				b_w = 50;
			else
				b_w = 10;
		}
		public function update(sp:Sprite):void
		{
			var p:b2Vec2=body.GetWorldCenter();
			sp.x=-p.x*30+400;
			sp.y=-p.y*30+300;
			body.ApplyForce(wind,p);
			if(is_dash)
				dash();
		}
		public function move(angle:Number/*left:Boolean*/):void
		{
			/*if(left)
			{
//				if(direct>-PI/4)
					body.SetAngle(direct-ma);
			}
			else
			{
//				if(direct<PI/4)
					body.SetAngle(direct+ma);
			}*/
			body.SetAngle(angle);
		}
		
		public function getType():String
		{
			return "hero";
		}
		public function hit(type:String):void
		{
			if(type=="fire")
			{
				enegry+=100;
				score+=100;
				updateUI();
			}
		}
		
		/**比例系数*/
		private const mu:Number=0.1;
		/**角度每次修改的幅度*/
		private const ma:Number=0.1;
	}
}