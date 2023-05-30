import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
   
class ExerciseDoneMenuDelegate extends MyMenuDelegate {

	var _program;
	var _endOfProgram;

    function initialize(program as Program) {
        MyMenuDelegate.initialize();
        _program = program;
 		_endOfProgram = false;
    }

	function onSelect(item) {
    	switch (item.getId()) {
    	case :item_next_exercise:
	    	if (_program.nextExercise()) {
   				WatchUi.popView(WatchUi.SLIDE_RIGHT);
	   			WatchUi.popView(WatchUi.SLIDE_RIGHT);
	   		} else {
       	 		Alert(WatchUi.loadResource(Rez.Strings.end_of_program));
       	 		_program.goTofirstExercise();
       	 		_endOfProgram = true;
	   		}
	    	break;
    	case :item_exercise_settings:
			$.MachineSettingListMenu(_program.getCurrentExercise().getMachine());
	    	break;
    	}
    }

	function onBack() {
		if (_endOfProgram) {
			WatchUi.popView(WatchUi.SLIDE_RIGHT);
			WatchUi.popView(WatchUi.SLIDE_RIGHT);
			WatchUi.popView(WatchUi.SLIDE_RIGHT);
		} else {
			WatchUi.popView(WatchUi.SLIDE_RIGHT);
		}
    }
}

function ExerciseDoneMenu(program as Program) {
   	var menu = new MyMenu(program.getCurrentExercise().getMachine().getName());

	menu.addItem(new MyMenuItem(Rez.Strings.next_exercise, null, :item_next_exercise));
	menu.addItem(new MyMenuItem(Rez.Strings.settings, null, :item_exercise_settings));

 	WatchUi.pushView(menu, new ExerciseDoneMenuDelegate(program), WatchUi.SLIDE_LEFT);
}

