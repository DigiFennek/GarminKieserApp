import Toybox.Lang;
import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Timer;

class AlertDelegate extends WatchUi.InputDelegate
{
	function initialize(view) {
		InputDelegate.initialize();
	}

	function onKey(evt) {
		WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
		return true;
	}
}

class AlertView extends WatchUi.View
{
	hidden var _timer;
	hidden var _text;
	hidden var _font;

	function initialize(text as String) {
		View.initialize();
	    _text = text;
	    _timer = new Timer.Timer();
	    _font = Graphics.FONT_MEDIUM;
	}

   	function dismissTimerCallback() {
		WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
   	}
   	
	function onShow() {
		_timer.start(method(:dismissTimerCallback), 2000, false);
	}

	function onHide() {
		_timer.stop();
	}

	function onUpdate(dc as Dc) {
		var textDimensions = dc.getTextDimensions(_text, _font); 
		var textWidth = textDimensions[0];
		var textHeight = textDimensions[1];

		var borderWidth = textWidth + 28;
		var borderHeight = textHeight + 20;

		var borderX = (dc.getWidth() - borderWidth) / 2;
		var borderY = (dc.getHeight() - borderHeight) / 2;

		dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
		dc.fillRoundedRectangle(borderX, borderY, borderWidth, borderHeight, 5);
		dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
		dc.setPenWidth(2);
		dc.drawRoundedRectangle(borderX, borderY, borderWidth, borderHeight, 5);

		var textX = dc.getWidth() / 2;
		var textY = borderY + borderHeight / 2;
		dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
		dc.drawText(textX, textY, _font, _text, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
	}
}

function Alert(text) {
	WatchUi.pushView(new AlertView(text), new AlertDelegate(self), WatchUi.SLIDE_IMMEDIATE);
}
