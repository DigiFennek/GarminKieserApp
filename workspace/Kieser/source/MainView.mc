import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Timer;

var _selected = 0;

class MainView extends WatchUi.View {

    public function initialize() {
        View.initialize();
    }

    public function onUpdate(dc as Dc) as Void {
    
    	dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
	   	dc.clear();

    	var x = dc.getWidth() / 2;
    	var y = dc.getHeight() / 2;    	
    	var dx = dc.getWidth() / 4; 
    	var dy = (dc.getHeight() - 2 * $.titleHeight) / 4; 
    	
		new $.DrawableMenuTitle($.titleHeight, Rez.Strings.program).draw(dc);
    	new $.ProgramItem("1", x - dx, y - dy, _selected == 0).draw(dc);
    	new $.ProgramItem("2", x + dx, y - dy, _selected == 1).draw(dc);
    	new $.ProgramItem("3", x - dx, y + dy, _selected == 2).draw(dc);
    	new $.ProgramItem("4", x + dx, y + dy, _selected == 3).draw(dc);    	
    	new $.DrawableMenuFooter($.titleHeight).draw(dc);
    }
}

class ProgramItem extends WatchUi.Drawable {

	private var _x;
	private var _y;
	private var _text;
	private var _selected;

    public function initialize(text as String, x as Number, y as Numer, selected as Boolean) {
        Drawable.initialize({});
        _x = x;
        _y = y;
        _text = text;
        _selected = selected;
    }

    public function draw(dc as Dc) as Void {
    	var dx = 64;
    	var dy = 36;

    	if (_selected) {
    		dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
    		dc.fillRoundedRectangle(_x - dx / 2, _y - dy / 2, dx, dy, 5);
	       	dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
    	} else {		
    		dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
			dc.setPenWidth(2);
    		dc.drawRoundedRectangle(_x - dx / 2, _y - dy / 2, dx, dy, 5);
	       	dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
   		}

   	    dc.drawText(_x, _y, $.titleFont, _text, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}

class MainViewDelegate extends WatchUi.BehaviorDelegate {

    public function initialize() {
        BehaviorDelegate.initialize();
    }

    public function onMenu() as Boolean {
    	ProgramEditMenu(programList.getProgram(_selected), 0);
        return true;
    }

    public function onKey(event as KeyEvent) as Boolean {
    	switch (event.getKey()) {
    	case KEY_UP:
    		if (_selected > 0) {
    			_selected--;
    		} else {
    			_selected = 3;
    		}    		
    		WatchUi.requestUpdate();
    		return true;
    	case KEY_DOWN:
    		if (_selected < 3) {
    			_selected++;
    		} else {
    			_selected = 0;
    		} 
    		WatchUi.requestUpdate();
    		return true;
    	case KEY_ENTER:
    		ExerciseStart(programList.getProgram(_selected));
    		return true;
    	}
    	return false;
	}
}
