import Toybox.Lang;
import Toybox.Graphics;
import Toybox.WatchUi;

class DigitFactory extends WatchUi.PickerFactory {

    function initialize() {
        PickerFactory.initialize();
    }

    function getDrawable(index, selected) {
        return new  DigitDrawable(index, selected, getSize());   
    }

    function getIndex(value) {
        return value;
    }

    function getValue(index) {
        return index;
    }

    function getSize() {
        return 10;
    }
}

class DigitDrawable extends WatchUi.Drawable {

	private var _index;
	private var _selected;
	
    public function initialize(index, selected, size) {
        Drawable.initialize({});
        _index = index;
        _selected = selected;
    }

    public function draw(dc as Dc) as Void {

    	var x = dc.getWidth() / 2;
    	var y = dc.getHeight() / 2;
    	
    	var text = (_index).format("%d");   
    	var font = Graphics.FONT_NUMBER_MILD;
    	    	
    	if (_selected) {
    		var x1 = 3;
    		var y1 = dc.getHeight() - 7;
    		var x2 = dc.getWidth() - 3;
    		var y2 = dc.getHeight() - 3;
	    	
	    	dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
	    	dc.setPenWidth(3);
    		dc.drawLine(x1, y1, x1, y2);
    		dc.drawLine(x1, y2, x2, y2);
	    	dc.drawLine(x2, y2, x2, y1);
    		
    		font = Graphics.FONT_NUMBER_HOT;
    	}

    	dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
   		dc.drawText(x, y, font, text, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}

class EmptyDrawable extends WatchUi.Drawable {

    public function initialize() {
        Drawable.initialize({});
    }

    public function draw(dc as Dc) as Void {
    }
}

//! Class to show the picker layout for the current device
class NumberPicker extends WatchUi.Picker {

	var _title;
	
    //! Constructor 
    public function initialize(title, value, digitCount) {
        
        _title = title;
        
        var pattern = new[digitCount];
        var defaults = new[digitCount];

        for (var i = 0; i < digitCount; i += 1) {
        	var digitFactory = new DigitFactory();
        	pattern[i] = digitFactory;
        	defaults[digitCount - i - 1] = digitFactory.getIndex(value % 10);        	
        	value /= 10;
        }
        
        Picker.initialize(
        	{
                :title=>new EmptyDrawable(),
                :pattern=>pattern,
                :defaults=>defaults,
                :nextArrow=>new EmptyDrawable(),
                :previousArrow=>new EmptyDrawable(),
                :confirm=>new WatchUi.Bitmap({:rezId=>$.Rez.Drawables.CheckIcon, :locX=>WatchUi.LAYOUT_HALIGN_CENTER, :locY=>WatchUi.LAYOUT_VALIGN_CENTER})
            }
    	);        
    }

    //! Update the view
    //! @param dc Device Context
    public function onUpdate(dc as Dc) as Void {
    	dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
	   	dc.clear();
    	dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
    	dc.fillRectangle(0, 0, dc.getWidth(), $.titleHeight);
		var textX = dc.getWidth() / 2;
		var textY = $.titleHeight / 2;		
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
       	dc.drawText(textX, textY, $.titleFont, _title, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}

//! Responds to a layout picker selection or cancellation
class NumberPickerDelegate extends WatchUi.PickerDelegate {

    //! Constructor
    public function initialize() {
        PickerDelegate.initialize();
    }

    //! Handle a cancel event from the picker
    //! @return true if handled, false otherwise
    public function onCancel() as Boolean {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        return true;
    }

	public function onSelect(value) as Void {		
	}

    //! Handle a confirm event from the picker
    //! @param values The values chosen in the picker
    //! @return true if handled, false otherwise
    public function onAccept(values as Array) as Boolean {
    	var value = 0;
    	for (var i = 0; i < values.size(); i += 1) {
    		value *= 10;  
    		value += values[i];
    	}
		onSelect(value);
        return true;
    }
}

