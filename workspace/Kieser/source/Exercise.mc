class Exercise {

	private var _machine;
	private var _timer;
	    
    function initialize(machine as Machine) {
    	_machine = machine;
    	_timer = 0;
    }
    
    function getMachine() {
    	return _machine;
    }

    function getTimer() {
    	return _timer;
    }
    
    function updateTimer() {
    	if (_timer < 300) {
    		_timer++;
    	}
    }

    function startTimer() {
   		_timer = -5;
    }
}
