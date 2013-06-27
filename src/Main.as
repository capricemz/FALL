package 
{
	import com.framework.ModuleControl;
	import com.framework.ModuleIds;
	import com.framework.ModulesHandle;
	
	import flash.display.Sprite;
	
	[SWF(frameRate="30",width="800",height="600")]
	public class Main extends Sprite
	{
		public function Main()
		{
			super();
			var moduleHandle:ModulesHandle = new ModulesHandle();
			moduleHandle.registerAll();
			ModuleControl.getInstance().callModule(ModuleIds.MAIN);//启动游戏
		}
	}
}