import Toybox.WatchUi;

class MachineSettingPickerMenuDelegate extends NumberPickerDelegate {

	var _machineSetting;
	var _parentMenu;

    function initialize(machineSetting, parentMenu) {
    	_machineSetting = machineSetting;
    	_parentMenu = parentMenu;
       	NumberPickerDelegate.initialize();
    }

	function onSelect(value) {
		_machineSetting.setValue(value);
		refreshMenuSubLabel(_parentMenu, _machineSetting, _machineSetting.getText());
		WatchUi.popView(WatchUi.SLIDE_RIGHT);
    }
}

function MachineSettingPickerMenu(machineSetting, parentMenu) {
	
	WatchUi.pushView(
		new $.NumberPicker(machineSetting.getName(), machineSetting.getText().toNumber(), 3), 
		new $.MachineSettingPickerMenuDelegate(machineSetting, parentMenu), 
		WatchUi.SLIDE_LEFT
	);    
	
}
