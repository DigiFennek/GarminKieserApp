import Toybox.Lang;
import Toybox.Graphics;
import Toybox.System;
import Toybox.WatchUi; 

class ProgramEditMachineMenuDelegate extends MyMenuDelegate {

	var _program;
	var _index;

   	function initialize(program as Program, index as Number) {
       	MyMenuDelegate.initialize();
       	_program = program;
       	_index = index;
   	}

    public function onSelect(item) as Void {
    	var exercise = _program.getExercise(_index);
    	var machine = exercise.getMachine();
    	var title;
    	switch (item.getId()) {
    		case :menu_item_settings:
	    		$.MachineSettingListMenu(machine);
    			break;
    		case :menu_item_delete_machine:
				title = WatchUi.loadResource(Rez.Strings.remove) + "?";
    			$.YesNoMenu(title, new ProgramEditMenuYesNoMenuDelegate(_program, _index));
    			break;
    		case :menu_item_insert_machine:
				title = WatchUi.loadResource(Rez.Strings.insert);
 		   		$.MachineListMenu(title, new ProgramEditMenuMachineListMenuDelegate(_program, _index));
    			break;
    	}
   	}

    public function onBack() as Void {
		WatchUi.popView(WatchUi.SLIDE_RIGHT);
	}    
}	

class ProgramEditMenuMachineListMenuDelegate extends MachineListMenuDelegate {

	var _program;
	var _index;

    function initialize(program, index) {
   	    MachineListMenuDelegate.initialize();
       	_program = program;
       	_index = index;
   	}
    	
   	function onSelectMachine(machine as Machine) {
   		var exercise = new Exercise(machine);
		_program.insertExercise(exercise, _index);
		WatchUi.popView(WatchUi.SLIDE_RIGHT);
		WatchUi.popView(WatchUi.SLIDE_RIGHT);
		WatchUi.popView(WatchUi.SLIDE_RIGHT);
		WatchUi.popView(WatchUi.SLIDE_RIGHT);
		ProgramEditMenu(_program, _index);
   	}
}

class ProgramEditMenuYesNoMenuDelegate extends YesNoMenuDelegate {
	
	var _program;
	var _index;

    function initialize(program as Program, index as Number) {
   	    YesNoMenuDelegate.initialize();
       	_program = program;
       	_index = index;
   	}
   	
   	function onYes() {
		_program.removeExercise(_program.getExercise(_index));
   		WatchUi.popView(WatchUi.SLIDE_RIGHT);
   		WatchUi.popView(WatchUi.SLIDE_RIGHT);
		ProgramEditMenu(_program, 0);
   	}
	
   	function onNo() {
   		WatchUi.popView(WatchUi.SLIDE_RIGHT);
   	}	
}

function ProgramEditMachineMenu(program as Program, index as Number) {	
   	var menu = new MyMenu(program.getExercise(index).getMachine().getName());

	menu.addItem(new MyMenuItem(Rez.Strings.settings, null, :menu_item_settings));
	menu.addItem(new MyMenuItem(Rez.Strings.remove, null, :menu_item_delete_machine));
	menu.addItem(new MyMenuItem(Rez.Strings.insert, null, :menu_item_insert_machine));

 	WatchUi.pushView(menu, new ProgramEditMachineMenuDelegate(program, index), WatchUi.SLIDE_LEFT);
}
