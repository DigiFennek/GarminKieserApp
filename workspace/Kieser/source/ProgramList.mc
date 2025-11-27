import Toybox.Lang;

class ProgramList {

	private var programList as Array;
	
	function initialize() { 
    	programList = new[0];
    	
    	for (var i = 0; i < 4; i += 1) {
    		programList.add(new Program(i));
    	}   	
	}
	
	function getProgram(index as Number) {
		if (index < programList.size()) {
			return programList[index];
		} else {
			return null;
		}
	}
	
	function savePrograms() {
		for (var i = 0; i < programList.size(); i += 1) {
			programList[i].saveExercises();
		}
	}
}
