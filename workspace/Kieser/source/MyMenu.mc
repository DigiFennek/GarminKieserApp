import Toybox.Lang;
import Toybox.Graphics;
import Toybox.System;
import Toybox.WatchUi; 

class MyMenu extends WatchUi.CustomMenu {

	private var _title;

   	function initialize(title) {
       	_title = title;
//       	CustomMenu.initialize(32, Graphics.COLOR_WHITE, {:focusItemHeight=>44, :titleItemHeight=>$.titleHeight, :footerItemHeight=>$.titleHeight});
       	CustomMenu.initialize(80, Graphics.COLOR_WHITE, {});
   	}   	
   	
   	public function drawTitle(dc as Dc) as Void {
   		new DrawableMenuTitle(dc.getHeight(), _title).draw(dc);
   	}

   	public function drawFooter(dc as Dc) as Void {
   		new DrawableMenuFooter(dc.getHeight()).draw(dc);
   	}
}	

class MyMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }
	
	public function onWrap(key as Key) as Boolean {
        return false;
    }
}

class MyMenuItem extends WatchUi.CustomMenuItem {

    private var _label as String = "";
    private var _subLabel as String = "";

    public function initialize(label as Lang.String or Lang.Symbol, subLabel as Lang.String or Lang.Symbol or Null, identifier) {
        CustomMenuItem.initialize(identifier, {});

		if (label instanceof Lang.String) {
		  	_label = label;
		} else {
			_label = WatchUi.loadResource(label);
		}

		setSubLabel(subLabel);
    }

    //! Draw the item string at the center of the item.
    //! @param dc Device context
    public function draw(dc as Dc) as Void {
        var font = Graphics.FONT_SMALL;
        if (isFocused()) {
            font = Graphics.FONT_LARGE;
        }

		var text = _label;
		
		if (_subLabel.length()) {
			text += ": " + _subLabel;
		}

        if (isFocused()) {
	        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
  			dc.fillRoundedRectangle(10, 10, dc.getWidth() - 20, dc.getHeight() - 20, 5);
        	dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        } else {
        	dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        }

		var textX = dc.getWidth() / 2;
		var textY = dc.getHeight() / 2;
		
       	dc.drawText(textX, textY, font, text, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

 	function setSubLabel(subLabel as Lang.String or Lang.Symbol or Null) as Void {
		if (subLabel) {
			if (subLabel instanceof Lang.String) {
		  		_subLabel = subLabel;
			} else {
				_subLabel = WatchUi.loadResource(subLabel);
			}
		}
	}
}

//! This is the custom drawable we will use for our main menu title
class DrawableMenuTitle extends WatchUi.Drawable {

	private var _height as Number;
	private var _title as String;
	
    //! Constructor
    public function initialize(height as Number, title as Lang.String or Lang.Symbol) {
        Drawable.initialize({});
		_height = height;		
		if (title instanceof Lang.String) {
		  	_title = title;
		} else {
			_title = WatchUi.loadResource(title);
		}
    }

    //! Draw the application icon and main menu title
    //! @param dc Device Context
    public function draw(dc as Dc) as Void {
		var textX = dc.getWidth() / 2;
		var textY = _height / 2;
		
    	dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
    	dc.fillRectangle(0, 0, dc.getWidth(), _height);		
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(textX, textY, $.titleFont, _title, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}

//! This is the drawable for the custom menu footer
class DrawableMenuFooter extends WatchUi.Drawable {

	private var _height as Number;

    public function initialize(height as Number) {
        Drawable.initialize({});
        _height = height;        
    }

    //! Draw bottom half of the last dividing line below the final item
    //! @param dc Device context
    public function draw(dc as Dc) as Void {
        var appIcon = WatchUi.loadResource($.Rez.Drawables.LauncherIcon) as BitmapResource;
        var bitmapX = (dc.getWidth() - appIcon.getHeight()) / 2;
        var bitmapY = dc.getHeight() - (_height + appIcon.getHeight()) / 2;
		
    	dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
    	dc.fillRectangle(0, dc.getHeight() - _height, dc.getWidth(), dc.getHeight());
        dc.drawBitmap(bitmapX, bitmapY, appIcon);
    }
}
