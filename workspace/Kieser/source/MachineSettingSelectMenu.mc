import Toybox.Lang;
import Toybox.WatchUi;

class MachineSettingSelectMenuDelegate extends MyMenuDelegate {

	var _machineSetting;
	var _parentMenu;

    function initialize(machineSetting, parentMenu) {
    	_machineSetting = machineSetting;
    	_parentMenu = parentMenu;
       	MyMenuDelegate.initialize();
    }

	function onSelect(item) {
		var value = item.getId();
		_machineSetting.setValue(value);
		refreshMenuSubLabel(_parentMenu, _machineSetting, _machineSetting.getText());
		WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }

    public function onBack() as Void {
		WatchUi.popView(WatchUi.SLIDE_RIGHT);
	}    
}

function MachineSettingSelectMenu(machineSetting, parentMenu) {
    var menu = new MyMenu(machineSetting.getName());

	for (var i = 0; machineSetting.valueToString(i); i += 1) {
  		menu.addItem(new MyMenuItem(machineSetting.valueToString(i), null, i));
  		
		if (machineSetting.valueToString(i).equals(machineSetting.getText())) {
			menu.setFocus(i);
		}
	}
    
	WatchUi.pushView(menu, new MachineSettingSelectMenuDelegate(machineSetting, parentMenu), WatchUi.SLIDE_LEFT);
}
