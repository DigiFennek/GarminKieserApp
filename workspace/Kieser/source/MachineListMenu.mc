import Toybox.Lang;
import Toybox.Graphics;
import Toybox.System;
import Toybox.WatchUi; 

function MachineListMenu(title as String, menuDelegate as MachineListMenuDelegate) {	
	var lastPrefix = "";
   	var menu = new MyMenu(title);
	for( var i = 0; machineList.getMachine(i); i += 1 ) {	
		var machine = machineList.getMachine(i);
		var machineName = machine.getName();
		var prefix = machineName.substring(0, 1); 				
		if (!prefix.equals(lastPrefix)) {
			lastPrefix = prefix;
    		menu.addItem(new MyMenuItem(prefix, null, prefix));
		}
	}
	WatchUi.pushView(menu, new MachinePrefixMenuDelegate(menuDelegate), WatchUi.SLIDE_LEFT);
}

class MachineListMenuDelegate extends MyMenuDelegate {

   	function initialize() {
       	MyMenuDelegate.initialize();
   	}

    public function onSelectMachine(machine as Machine) as Void {
   	}

    public function onSelect(item) as Void {
		onSelectMachine(item.getId());
   	}

    public function onBack() as Void {
		WatchUi.popView(WatchUi.SLIDE_RIGHT);
	}    
}	

class MachinePrefixMenuDelegate extends MyMenuDelegate {

	private var _menuDelegate as MachineListMenuDelegate;

   	function initialize(menuDelegate as MachineListMenuDelegate) {
       	MyMenuDelegate.initialize();
    	_menuDelegate = menuDelegate;	
   	}

    public function onSelect(item) as Void {
    	var filter = item.getId();
		var title = WatchUi.loadResource($.Rez.Strings.machines) + " " + filter;
   		var menu = new MyMenu(title);
		for( var i = 0; $.machineList.getMachine(i); i += 1 ) {	
			var machine = $.machineList.getMachine(i);
			var machineName = machine.getName();
			var prefix = machineName.substring(0, 1); 				
		 	if (prefix.equals(filter)) {
   				menu.addItem(new MyMenuItem(machineName, null, machine));
	 		}
		}			
		WatchUi.pushView(menu, _menuDelegate, WatchUi.SLIDE_LEFT);
	} 

    public function onBack() as Void {
		WatchUi.popView(WatchUi.SLIDE_RIGHT);
	}    
}	
