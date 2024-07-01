import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;

class RollingPaceView extends WatchUi.SimpleDataField {

    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        label = "Rolling Pace";
    }

    function compute(info as Activity.Info) as Numeric or Duration or String or Null {
        if (info.currentLocation == null) {
            return 0.0;
        }
        return info.currentLocation;
    }

}