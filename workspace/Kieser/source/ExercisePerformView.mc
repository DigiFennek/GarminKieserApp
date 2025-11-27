import Toybox.Lang;
import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Timer;
import Toybox.Attention;

class ExercisePerformView extends WatchUi.View {

	private var _exercise;
   	private var _exerciseTimer;
   	private var _exerciseHalfSecond;
   	private var _exerciseColor;
   	private var _vibrateCounter;

   	function initialize(program as Program) {
        View.initialize();
       	_exercise = program.getCurrentExercise();
       	_exerciseTimer = new Timer.Timer();
		_exerciseHalfSecond = false;
    	_exerciseColor = Graphics.COLOR_BLACK;
       	_vibrateCounter = 0;
    	_exercise.startTimer();
    }

	public function onShow() as Void {
		_exerciseTimer.start( method(:exerciseTimerCallback), 500, true );
	}

	public function onHide() as Void {
		_exerciseTimer.stop();
    }
                
	private function vibrate(count as Number) {
		_vibrateCounter = count;
	}                
                
   	public function exerciseTimerCallback() {
	
		if (_exerciseHalfSecond) {
			_exercise.updateTimer(); 	

			switch(_exercise.getTimer()) {
			case 0:
   	   			vibrate(1);
	    		_exerciseColor = Graphics.COLOR_RED;
	    		break;
			case 60:
   		   		vibrate(2);
	    		_exerciseColor = Graphics.COLOR_YELLOW;
	    		break;
			case 90:
   		   		vibrate(3);
	    		_exerciseColor = Graphics.COLOR_GREEN;
	    		break;
			case 120:
   		   		vibrate(4);
	    		_exerciseColor = Graphics.COLOR_BLUE;
	    		break;
	    	}	       	
		}
			 
		_exerciseHalfSecond = !_exerciseHalfSecond;			 
			 
   		WatchUi.requestUpdate();		

		if (_vibrateCounter > 0) {
			_vibrateCounter--;
			var vibrateData = [new Attention.VibeProfile(100, 100)] as Array<VibeProfile>;
        	Attention.vibrate(vibrateData);
        }         
	}

    public function onUpdate(dc as Dc) as Void {   	   	

   		dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
	   	dc.clear();

        var x = dc.getWidth() / 2;
        var y = dc.getHeight() / 2;   	   	
   	   	var seconds = (_exercise.getTimer().abs() % 60).format("%.2d");
   	   	var minutes = (_exercise.getTimer().abs() / 60).format("%.2d");   	   	
		var colon = _exerciseHalfSecond ? " " : ":";		 
    	dc.setColor(_exerciseColor, Graphics.COLOR_WHITE);
   	   	dc.drawText(x - 10, y, Graphics.FONT_SYSTEM_NUMBER_HOT, minutes, Graphics.TEXT_JUSTIFY_RIGHT  | Graphics.TEXT_JUSTIFY_VCENTER);   	   	
   	   	dc.drawText(x,      y, Graphics.FONT_SYSTEM_NUMBER_HOT, colon,   Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);   	   	
   	   	dc.drawText(x + 10, y, Graphics.FONT_SYSTEM_NUMBER_HOT, seconds, Graphics.TEXT_JUSTIFY_LEFT   | Graphics.TEXT_JUSTIFY_VCENTER);   	   	

		new $.DrawableMenuTitle($.titleHeight, _exercise.getMachine().getName()).draw(dc);
    	new $.DrawableMenuFooter($.titleHeight).draw(dc);
    }
}

class ExercisePerformViewBehaviorDelegate extends WatchUi.BehaviorDelegate {

	var _program;

    public function initialize(program) {
        BehaviorDelegate.initialize();
       	_program = program;
    }
    
    public function onSelect() as Boolean {
        ExerciseDoneMenu(_program);
        return true;
    }
}

class ExercisePerformViewYesNoMenuDelegate extends YesNoMenuDelegate {
	
    function initialize() {
   	    YesNoMenuDelegate.initialize();
   	}
   	
   	function onYes() {
   		WatchUi.popView(WatchUi.SLIDE_RIGHT);
   	}
	
   	function onNo() {
   	}	
}


function ExercisePerform(program as Program) {
 	WatchUi.pushView(new $.ExercisePerformView(program), new $.ExercisePerformViewBehaviorDelegate(program), WatchUi.SLIDE_LEFT);
}
