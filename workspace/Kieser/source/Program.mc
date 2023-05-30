import Toybox.Lang;
import Toybox.Application.Storage;

class Program {

	private var _index;
	private var _exercises as Array;
	private var _storage;
	private var _currentExercise;
	    
    function initialize(index as Number) {
    	_index = index;
      	_exercises = new[0];
		_storage = Storage.getValue("P" + _index);
      	loadExercises();
      	_currentExercise = 0;
    }

	function getName() {
		return WatchUi.loadResource(Rez.Strings.program) + " " + (_index + 1);
	}
	
	function addExercise(exercise as Exercise) {
		_exercises.add(exercise);
	}
	
	function removeExercise(exercise as Exercise) {
		_exercises.remove(exercise);
	}
	
	function insertExercise(exercise as Exercise, index as Number) {
		var array = new[0];
		if (index > 0) {
			array = _exercises.slice(0, index);
		}
		array.add(exercise);
		if (_exercises.size() > index) {
			array.addAll(_exercises.slice(index, _exercises.size()));
		}
		_exercises = array;
	}
	
	function loadExercises() {
		if (_storage) {
			var end, start = 0;
			for (end = 0; end < _storage.length(); end++) {
				var subString = _storage.substring(end, end + 1);
				if (subString.equals(";")) {
					var machineName = _storage.substring(start, end);
					var machine = machineList.findMachine(machineName);
			   		var exercise = new Exercise(machine);
					addExercise(exercise);
					start = end + 1;
				}
			}
		}
	}

	function saveExercises() {
		var storage = "";
		for (var i = 0; i < _exercises.size(); i += 1) {
			storage += _exercises[i].getMachine().getName();
			storage += ';';
		}
		if (!storage.equals(_storage)) {
			Storage.setValue("P" + _index, storage);
		}
	}

	function getExercise(index as Number) {
		if (index < _exercises.size()) {
			return _exercises[index];
		} else {
			return null;
		}
	}
	
	function prevoiusExercise() as Boolean {
		if (_currentExercise > 0) {
			_currentExercise--;
			return true;
		} else {
			return false;
		}
	}
	
	function nextExercise() as Boolean {
		if (_currentExercise < _exercises.size() - 1) {
			_currentExercise++;
			return true;
		} else {
			return false;
		}
	}
	
	function goTofirstExercise()  {
		_currentExercise = 0;
	}

	function getCurrentExercise() as Exercise {
		return getExercise(_currentExercise);
	}
}
