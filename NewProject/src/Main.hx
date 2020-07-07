package;

import openfl.display.Sprite;
import openfl.Lib;
import haxe.ui.Toolkit;
import haxe.ui.HaxeUIApp;
import haxe.ui.containers.TabView;
import haxe.ui.containers.dialogs.MessageBox;
import haxe.ui.containers.VBox;
import haxe.ui.components.Button;
import haxe.ui.containers.Grid;
import haxe.ui.components.TextArea;

/**
 * ...
 * @author MHromovyi
 */
class Main extends Sprite 
{
	static function constructCustomGrid():Grid
	{
		var customGrid:Grid = new Grid();
		customGrid.columns = 4;
		customGrid.width = 400;
		customGrid.height = 400;
		
		for (i in 1...17)
		{
			var button:Button = new Button();
			button.text = "Button " + i;
			button.icon = "haxeui-core/styles/default/haxeui_tiny.png";
			button.onClick = function(e)
			{
				var messageBox:MessageBox = new MessageBox();
		        messageBox.message = button.text + " pressed";
				messageBox.show();
			}
			customGrid.addComponent(button);
		}
		return customGrid;
	}
	
	public function new() 
	{
		super();
		Toolkit.init();	
		var app:HaxeUIApp = new HaxeUIApp();
			
		var tabView:TabView = new TabView();
		for (i in 1...4)
		{
			var grid = constructCustomGrid();
			grid.id = "grid" + i;
			
			var textArea:TextArea = new TextArea();
			textArea.width = 400;
			textArea.disabled = true;
			textArea.text = "You are currently at page " + i + ".\n";
			if (sys.io.File.getContent("assets/sample.txt") != null)
			{
				textArea.text += sys.io.File.getContent("assets/sample.txt");
			}
			
			var box:VBox = new VBox();
			box.width = 400;
			box.height = 400;
			
			box.addComponent(textArea);
			box.addComponent(grid);

			box.id = "box" + i;
			box.text = "Page " + i;
			tabView.addComponent(box);
		}
		
		app.addComponent(tabView);
		app.start();
	}
}
