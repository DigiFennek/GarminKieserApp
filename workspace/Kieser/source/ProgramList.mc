class ProgramList {

	private var programList as Array;
	
	function initialize() { 
    	programList = new[4];
    	
    	for (var i = 0; i < programList.size(); i += 1) {
    		programList[i] = new Program(i);
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
