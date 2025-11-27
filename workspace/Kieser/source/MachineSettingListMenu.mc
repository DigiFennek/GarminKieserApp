import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

function refreshMenuSubLabel(parentMenu, itemId, text)
{		
	var parentIndex = parentMenu.findItemById(itemId);
	var parentItem = parentMenu.getItem(parentIndex);

	if (parentItem)
	{
		parentItem.setSubLabel(text);
		parentMenu.updateItem(parentItem, parentIndex);
	}
}
    
class MachineSettingListMenuDelegate extends MyMenuDelegate {

	var _parentMenu as MyMenu;
	var _machine as Machine;

    function initialize(parentMenu, machine) {
       	MyMenuDelegate.initialize();
       	_parentMenu = parentMenu;
       	_machine = machine;
    }
    
	function onSelect(item) {
		var machineSetting = item.getId() as MachineSetting;
    	if (machineSetting != null) {
			if (machineSetting.useNumberPicker()) {
				MachineSettingPickerMenu(machineSetting, _parentMenu);
			} else {
				MachineSettingSelectMenu(machineSetting, _parentMenu);
			}
		}
    }

    public function onBack() as Void {
		WatchUi.popView(WatchUi.SLIDE_RIGHT);
	}    
}

function MachineSettingListMenu(machine) {
    var menu = new MyMenu(machine.getName());		    

	for( var i = 0; machine.getSetting(i) != null; i += 1 ) {
		var machineSetting = machine.getSetting(i);	
		menu.addItem(new MyMenuItem(machineSetting.getName(), machineSetting.getText(),	machineSetting));
    }

	WatchUi.pushView(menu, new MachineSettingListMenuDelegate(menu, machine), WatchUi.SLIDE_LEFT);
}
