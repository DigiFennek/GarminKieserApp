import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Timer;

class ExerciseStartView extends WatchUi.View {

	var _program;

   	function initialize(program as Program) {
        View.initialize();
       	_program = program;
    }

    function onUpdate(dc as Dc) as Void {
    	var exercise = _program.getCurrentExercise();

        var x = dc.getWidth() / 2;
        var y = dc.getHeight() / 2;
	   	
   		dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
	   	dc.clear();
   		dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
   		dc.fillRectangle(0, 0, dc.getWidth(), $.titleHeight);

    	if (exercise) {
	    	var machine = exercise.getMachine();
	   		var font = Graphics.FONT_SYSTEM_LARGE;
	   	
	    	dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
    	   	dc.drawText(x, $.titleHeight / 2, $.titleFont, machine.getName(), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
	    	dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        	
        	y = $.titleHeight;

	   	    var dy = dc.getFontHeight(font) * 0.8;
	
			for (var i = 0; machine.getSetting(i); i += 1) {
				var setting = machine.getSetting(i);		
				var text = setting.getName() + ": " + setting.getText();	
        		dc.drawText(x, y, font, text, Graphics.TEXT_JUSTIFY_CENTER);
        		y += dy;
        	}
    	} else {
    		dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
    		dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());
	    	dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
    	   	dc.drawText(x, y, Graphics.FONT_SYSTEM_SMALL, WatchUi.loadResource(Rez.Strings.new_program), Graphics.TEXT_JUSTIFY_CENTER |  Graphics.TEXT_JUSTIFY_VCENTER);
    	}
    }
}

class ExerciseStartBehaviorDelegate extends WatchUi.BehaviorDelegate {

	var _program;

    public function initialize(program) {
        BehaviorDelegate.initialize();
       	_program = program;
    }

    public function onSelect() as Boolean {
    	if (_program.getCurrentExercise()) {
    		ExercisePerform(_program);
    	} else {
	   		WatchUi.popView(WatchUi.SLIDE_RIGHT);
    	}
        return true;
    }

    public function onKey(evt as KeyEvent) as Boolean {
        var key = evt.getKey();
        switch(key) {
       	case KEY_UP:
       		 if (_program.prevoiusExercise()) {
	       		 WatchUi.requestUpdate();
       	 	} else {
       	 		Alert(WatchUi.loadResource(Rez.Strings.begin_of_program));
       		 }
       		break;
       	case KEY_DOWN:
    		if (_program.nextExercise()) {
       		 	WatchUi.requestUpdate();
       	 	} else {
       	 		Alert(WatchUi.loadResource(Rez.Strings.end_of_program));
       	 	}
       		break;        	
        }
        return false;
	}
}

function ExerciseStart(program as Program) {
    program.goTofirstExercise();
 	WatchUi.pushView(new $.ExerciseStartView(program), new $.ExerciseStartBehaviorDelegate(program), WatchUi.SLIDE_LEFT);
}
