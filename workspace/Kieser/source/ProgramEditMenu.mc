import Toybox.Graphics;
import Toybox.System;
import Toybox.WatchUi; 

function ProgramEditMenu(program as Program, focus as Number) {	
   	var menu = new MyMenu(program.getName());

	for( var i = 0; program.getExercise(i); i += 1 ) {	
	   	var machineName = program.getExercise(i).getMachine().getName();
   		menu.addItem(new MyMenuItem((i + 1).toString() + ": " + machineName, null, i));
	}

	menu.addItem(new MyMenuItem(WatchUi.loadResource(Rez.Strings.add_machine), null, :menu_item_add_machine));

	menu.setFocus(menu.findItemById(focus));

	WatchUi.pushView(menu, new ProgramEditMenuDelegate(program), WatchUi.SLIDE_LEFT);
}

class ProgramEditMenuDelegate extends MyMenuDelegate {

	var _program;

   	function initialize(program) {
       	MyMenuDelegate.initialize();
       	_program = program;
   	}

    public function onSelect(item as MyMenuItem) as Void {
    	if (item.getId() == :menu_item_add_machine) {
			var title = WatchUi.loadResource(Rez.Strings.add_machine);
    		$.MachineListMenu(title, new ProgramAddMachineListMenuDelegate(_program));
    	} else {
    		var index = item.getId();
    		$.ProgramEditMachineMenu(_program, index);
    	}
   	}

    public function onBack() as Void {
		WatchUi.popView(WatchUi.SLIDE_RIGHT);
	}    
}	

class ProgramAddMachineListMenuDelegate extends MachineListMenuDelegate {

	var _program;

    function initialize(program) {
   	    MachineListMenuDelegate.initialize();
       	_program = program;
   	}
    	
   	function onSelectMachine(machine as Machine) {
   		var exercise = new Exercise(machine);
		_program.addExercise(exercise);
		WatchUi.popView(WatchUi.SLIDE_RIGHT);
		WatchUi.popView(WatchUi.SLIDE_RIGHT);
		WatchUi.popView(WatchUi.SLIDE_RIGHT);
		ProgramEditMenu(_program, :menu_item_add_machine);
   	}
}

