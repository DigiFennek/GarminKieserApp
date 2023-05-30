import Toybox.Graphics;
import Toybox.System;
import Toybox.WatchUi; 

class YesNoMenuDelegate extends MyMenuDelegate {

   	function initialize() {
       	MyMenuDelegate.initialize();
   	}

    public function onSelect(item as MyMenuItem) as Void {
    	switch (item.getId()) {
    		case :menu_item_no:
	    		WatchUi.popView(WatchUi.SLIDE_RIGHT);
    			onNo();
    			break;
    		case :menu_item_yes:
	    		WatchUi.popView(WatchUi.SLIDE_RIGHT);
    			onYes();
    			break;
    	}
   	}

    public function onBack() as Void {
		WatchUi.popView(WatchUi.SLIDE_RIGHT);
	}    
}	

function YesNoMenu(title as String, menuDelegate as YesNoMenuDelegate) {	
	var menu = new MyMenu(title);

	menu.addItem(new MyMenuItem(Rez.Strings.no, null, :menu_item_no));
	menu.addItem(new MyMenuItem(Rez.Strings.yes, null, :menu_item_yes));

 	WatchUi.pushView(menu, menuDelegate, WatchUi.SLIDE_LEFT);
}
