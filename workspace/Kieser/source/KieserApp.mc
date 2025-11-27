import Toybox.Application;
import Toybox.Lang;
import Toybox.Graphics;
import Toybox.WatchUi;

public var machineList;
public var programList;

public var titleHeight = 80;
public var titleFont = Graphics.FONT_SYSTEM_MEDIUM;

class KieserApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
		machineList = new MachineList();
		programList = new ProgramList(); 
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    	machineList.saveSettings();
    	programList.savePrograms();
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [ new MainView(), new MainViewDelegate() ] ; 
    }
 }

function getApp() as KieserApp {
    return Application.getApp() as KieserApp;
}