import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;

using Toybox.Activity as Activity;
using Toybox.Application as App;
using Toybox.Application.Properties as Props;
using Toybox.System as Sys;


enum {
    OFF,
    ON,
    PAUSED,
    STOPPED
}

(:smallMem)
const bufLen = 350;

// (:largeMem)
// const bufLen = 1000;


class RollingPaceView extends WatchUi.SimpleDataField {
    hidden var useDist = true;
	hidden var averageOver = 100;

    hidden var state = OFF;
    hidden var deviceNotSupported = false;
 
    hidden var dataBuffer = new [bufLen];

    hidden var displayValue = "";

    function initialize() {
        var isDist;
        var rollingAverageDuration;

        SimpleDataField.initialize();
        label = "Rolling Pace";
        var info = Activity.getActivityInfo();
       	
        // Return if needed metrics not supported
        if (!(info has :timerTime) || !(info has :elapsedDistance)) {
       		label = "Rolling Pace";
       		deviceNotSupported = true;
       		return;
       	}

        dataBuffer[0] = 0;

        if ( App has :Properties ) {
	        isDist = Props.getValue("isDist");
        	rollingAverageDuration = Props.getValue("rollingDuration");
	    } else {
			var thisApp = App.getApp();
	        isDist = thisApp.getProperty("isDist");
	    	rollingAverageDuration = thisApp.getProperty("rollingDuration");
	    }

        if (isDist) {

        } else {

        }
    }
    
    function onTimerStart()
    {
        state = ON;
        displayValue = "0:00";
    }

    function onTimerStop()
    {
        state = STOPPED;
        dataBuffer[0] = 0;
    }

    function onTimerPause()
    {
        state = PAUSED;
    }

    function onTimerResume()
    {
        state = ON;
    }

    function onTimerReset()
    {
        state = OFF;
        displayValue = "0:00";
        dataBuffer[0] = 0;
    }

    function compute(info as Activity.Info) {
        if (deviceNotSupported) {
            return "Device Not Supported";
        }

        if (state != ON) {
            return "Not on";
        }

        return displayValue;
        // Use queue to push distance and timer fields. 
        // Display avg of said queue.
    }

}