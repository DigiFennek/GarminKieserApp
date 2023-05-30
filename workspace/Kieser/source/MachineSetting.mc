class MachineSetting {

	private var _nameId;
	private var _min;
	private var _max;
	private var _value;
	private var _stringIds;
	
    function initialize(nameId, min, max, stringIds) {
      	_nameId = nameId;
      	_min = min;
      	_max = max;
      	_value = 0;
      	_stringIds = stringIds;
    }
	
	function getName() as String {
		return WatchUi.loadResource(_nameId);
    }

	function setValue(value as Number) {
		if (_stringIds != null) {
			if (value < _stringIds.size()) {
				_value = value;
			}
		} else {
			if (value < _max) {
				_value = value;
			} else {
				_value = _max;
			}
		}
    }

	function valueToString(index) {
		if (_stringIds != null) {
			if (index < _stringIds.size()) {
				if (_stringIds[index] instanceof Lang.String) {
					return (_stringIds[index]);
				} else {
					return (WatchUi.loadResource(_stringIds[index]));
				}
			} else {
				return null;
			}
		} else {		    
			if (index <= (_max - _min)) {
		    	return (_min + index).toString();
		    } else {
		    	return null;
		    }
		}
	}
	
	function getValue() as Number {
		return _value;
	}
	
	function getText() as String {
		var text = valueToString(_value);
		if (text) {
			return text;
		} else {
			return "?";
		}	
	}
	
	function useNumberPicker() {
		return _nameId == Rez.Strings.weight;
	}
}

function numberLetterStringArray(count) as Array {
	var array = new[count];
	for (var i = 0; i < count; i++) {
		array[i] = (i + 1).toString() + "/" + (i + 'A');
	}
	return array; 
}
