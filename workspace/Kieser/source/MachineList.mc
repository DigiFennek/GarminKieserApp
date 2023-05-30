class MachineList {

	private var machineList as Array;
	
	function initialize() { 
		var machine;
		
    	machineList = new[0];   	
    	
    	machine = new Machine(machineList, "A1");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 498,	null));

    	machine = new Machine(machineList, "A2");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 298,	null));

    	machine = new Machine(machineList, "A3");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 298,	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.rest,	 	  1,   3,   null));
    	machine.addSetting(new MachineSetting(Rez.Strings.legs,		  1,   5,   null));

    	machine = new Machine(machineList, "A4");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 398,  	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.rest,		  1,   3,   null));

    	machine = new Machine(machineList, "A5");
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,	 	  1,  16,	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.back,		  1,  16,   null));
    	machine.addSetting(new MachineSetting(Rez.Strings.feets,	  1,   7,   null));

    	machine = new Machine(machineList, "B1");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 498,	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.rest,		  1,  11,   null));
    	machine.addSetting(new MachineSetting(Rez.Strings.legs,		  1,   3,   null));

    	machine = new Machine(machineList, "B3");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 298,	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.pad,		  0,   0,   [Rez.Strings.no, Rez.Strings.yes]));
    	machine.addSetting(new MachineSetting(Rez.Strings.ball,		  1,   3,   null));
    	machine.addSetting(new MachineSetting(Rez.Strings.heel,	 	  1,   3,   null));
    	machine.addSetting(new MachineSetting(Rez.Strings.feet,		  1,   3,   null));

    	machine = new Machine(machineList, "B4");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 298,  	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.pad,		  0,   0,   [Rez.Strings.no, Rez.Strings.yes]));
    	machine.addSetting(new MachineSetting(Rez.Strings.ball,		  1,   3,   null));
    	machine.addSetting(new MachineSetting(Rez.Strings.heel,	 	  1,   3,   null));
    	machine.addSetting(new MachineSetting(Rez.Strings.feet,		  1,   3,   null));

    	machine = new Machine(machineList, "B5");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 398,  	null));

    	machine = new Machine(machineList, "B6");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 498,  	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.rest,	 	  1,   3,   null));
    	machine.addSetting(new MachineSetting(Rez.Strings.shoulder,	  1,  14,   null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,	 	  1,  25,	null));

    	machine = new Machine(machineList, "B6-i");
    	machine.addSetting(new MachineSetting(Rez.Strings.force,	  0,  10,  	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,	 	  1,  21,	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.shoulder,	  1,  14,   null));

    	machine = new Machine(machineList, "B7");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 398,  	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.rest,		  1,  11,   null));

    	machine = new Machine(machineList, "B8");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 138,  	null));

    	machine = new Machine(machineList, "C1");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 298, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  0,  10,	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.rest, 	  0,   0, 	[Rez.Strings.rear, Rez.Strings.front]));
    	machine.addSetting(new MachineSetting(Rez.Strings.arms, 	  1,   3, 	null));
    		
    	machine = new Machine(machineList, "C2");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 498, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  0,  10,	null));
    		
    	machine = new Machine(machineList, "C3");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 498, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  0,  10,	null));
    		
    	machine = new Machine(machineList, "C5");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 398, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  1,  10,	null));
    		
    	machine = new Machine(machineList, "C7");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 498, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.rest,		  1,  11,   null));
    		
    	machine = new Machine(machineList, "D5");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 398, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  1,  11,   null));
    	machine.addSetting(new MachineSetting(Rez.Strings.arms,		  1,   3,   null));
    		
    	machine = new Machine(machineList, "D6");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 598, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  0,  10,   null));
    	machine.addSetting(new MachineSetting(Rez.Strings.rest,		  1,   9,   null));
    		
    	machine = new Machine(machineList, "D7");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 498, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  0,  10,   null));
    	machine.addSetting(new MachineSetting(Rez.Strings.handles,	  1,   2,   null));    	    	
    		
    	machine = new Machine(machineList, "E1");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 498, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  0,  10,   null));
    		
    	machine = new Machine(machineList, "E2");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 298, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  0,  10,   null));
    	machine.addSetting(new MachineSetting(Rez.Strings.rest,		  1,   6,   null));
    		
    	machine = new Machine(machineList, "E3");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 498, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  0,  10,   null));
    	machine.addSetting(new MachineSetting(Rez.Strings.rest,		  0,   0,   [Rez.Strings.rear, Rez.Strings.front]));
    		
    	machine = new Machine(machineList, "E4");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 398, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  1,  11,   null));
    		
    	machine = new Machine(machineList, "E5");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 398, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  1,  11,   null));
    	    	
    	machine = new Machine(machineList, "F1.1");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 398, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.feets,	  1,  19,   numberLetterStringArray(19)));
    	machine.addSetting(new MachineSetting(Rez.Strings.crank,	  1,  19,   null));
    	machine.addSetting(new MachineSetting(Rez.Strings.rotation,	  1,   8,   null));
    	    	
    	machine = new Machine(machineList, "F2");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 298, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.pad,	  	  0,   0,   [Rez.Strings.no, Rez.Strings.small, Rez.Strings.big]));
    	    	
    	machine = new Machine(machineList, "F2.1");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 298, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.feets,	  1,  20,   null));
    	    	
    	machine = new Machine(machineList, "F3");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 398, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.legs,	  	  1,  24,   null));
    	machine.addSetting(new MachineSetting(Rez.Strings.feets,	  1,  16,   null));
    	    	
    	machine = new Machine(machineList, "F3.1");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 398, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.feets,	  0,   0,   numberLetterStringArray(19)));
    	machine.addSetting(new MachineSetting(Rez.Strings.crank,	  1,  19,   null));
    	    	
	/*****/

    	machine = new Machine(machineList, "G1");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 999, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  1,  33,   null));    	    	

    	machine = new Machine(machineList, "G5");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 999, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  1,  33,   null));    	    	
    	machine.addSetting(new MachineSetting(Rez.Strings.pad,		  1,  33,   null));    	    	
    	machine.addSetting(new MachineSetting(Rez.Strings.head,		  1,  33,   null));    	    	

	/*****/
	
    	machine = new Machine(machineList, "H1");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 298, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  1,  11,   null));    	    	

    	machine = new Machine(machineList, "H2");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 298, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  0,  10,   null));    	    	
    	machine.addSetting(new MachineSetting(Rez.Strings.handles,	  1,   5,   null));    	    	

    	machine = new Machine(machineList, "H3");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 298, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  0,  10,   null));    	    	

    	machine = new Machine(machineList, "H4");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 298, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  0,  10,   null));    	    	

    	machine = new Machine(machineList, "H5");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 298, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  0,  10,   null));    	    	

    	machine = new Machine(machineList, "H6");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 298, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  0,  10,   null));    	    	

    	machine = new Machine(machineList, "H7");
    	machine.addSetting(new MachineSetting(Rez.Strings.weight,	  0, 298, 	null));
    	machine.addSetting(new MachineSetting(Rez.Strings.seat,		  0,  10,   null));    	    	
	}
	
	function getMachine(index as Number) {
		if (index < machineList.size()) {
			return machineList[index];
		} else {
			return null;
		}
	}
	
	function findMachine(name as String) {
		for (var i = 0; i < machineList.size(); i += 1) {
			if (machineList[i].getName().equals(name)) {
				return machineList[i];
			}
		}
		return null;
	}
	
	function saveSettings() {
		for (var i = 0; i < machineList.size(); i += 1) {
			machineList[i].saveSettings();
		}
	}
}
