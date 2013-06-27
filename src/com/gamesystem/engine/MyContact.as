package com.gamesystem.engine
{
	import Box2D.Dynamics.Contacts.b2Contact;
	import Box2D.Dynamics.b2ContactListener;
	import com.gamesystem.engine.I_Fs.Icontact;
	
	public class MyContact extends b2ContactListener
	{
		public function MyContact()
		{
			super();
		}
		public override function BeginContact(contact:b2Contact):void
		{
			var item1:Icontact=contact.GetFixtureA().GetUserData();
			var item2:Icontact=contact.GetFixtureB().GetUserData();
			if(item1&&item2)
			{
				item1.hit(item2.getType());
				item2.hit(item1.getType());
			}
		}
	}
}