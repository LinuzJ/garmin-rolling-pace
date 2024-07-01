import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;

class AppSettingsDelegate extends WatchUi.Menu2InputDelegate {
	hidden var mMenu;
	function initialize() {
		Menu2InputDelegate.initialize();
    }
    
	function onSelect(item) {
		if (item.getId().equals("rollingAverageduration")) {
            var durationPicker = new DurationPicker();
			WatchUi.pushView(durationPicker, new DurationPickerDelegate(durationPicker), WatchUi.SLIDE_IMMEDIATE );
	    }
    }
	
    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_DOWN);
    }
}

class AppSettingsView extends WatchUi.Menu2 {
	hidden var currentRollingAverageDuration;
	
	function initialize() {
		Menu2.initialize({:title=>"Settings"});
		
		currentRollingAverageDuration = Application.getApp().getProperty("rollingAverageDuration");
		
		addItem(
			new WatchUi.MenuItem(
				Rez.Strings.RAD,
				currentRollingAverageDuration.toString(),
				"rollingAverageDuration",
				{}
				)
			);
			
	}
	
	function onShow() {
		var rollingAverageDuration = Application.getApp().getProperty("rollingAverageDuration");
		if(rollingAverageDuration != currentRollingAverageDuration) {
			currentRollingAverageDuration = rollingAverageDuration;
		
			var item = self.getItem(0);
			if(item != null) {
				item.setSubLabel(currentRollingAverageDuration.toString());
				self.updateItem(item, 0);
			}
		}
	}
}
	
	