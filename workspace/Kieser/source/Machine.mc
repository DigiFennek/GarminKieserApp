import Toybox.Lang;
import Toybox.Application.Storage;

class Machine {
	private var _name;
	private var _settings as Array;
	private var _storage;
	
    function initialize(machineList as Array, name as String) {
      	_name = name;
      	_settings = new[0];
      	_storage = Storage.getValue(_name);
    	machineList.add(self);    	    	
    }
    
	function getName() {
		return _name;
    }

	function getStorageValue(index as Number) as Number {
		if (_storage) { 
			var end, start = 0;
			for (end = 0; end < _storage.length(); end++) {
				var subString = _storage.substring(end, end + 1);
				if (subString.equals(";")) {
					if (index == 0) {
						return _storage.substring(start, end).toNumber();
					}
					start = end + 1;
					index--;
				}
			}
			return 0;
		} else {
			return 0;
		}
	}

	function addSetting(setting as MachineSetting) {
		var value = getStorageValue(_settings.size());
		setting.setValue(value);
		_settings.add(setting);
	}

	function saveSettings() {
		var storage = "";
		for (var i = 0; i < _settings.size(); i += 1) {
			storage += _settings[i].getValue().format("%d");
			storage += ';';
		}
		if (!storage.equals(_storage)) {
			Storage.setValue(_name, storage);
		}
	}
	
	function getSetting(index as Number) {
		if (index < _settings.size()) {
			return _settings[index];
		} else {
			return null;
		}
	}
}
