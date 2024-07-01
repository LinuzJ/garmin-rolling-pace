using Toybox.Application;
using Toybox.Graphics;
using Toybox.WatchUi;

class DurationPicker extends WatchUi.Picker {
    const options = [10, 30];
    hidden var numberTitleText;
    hidden var numberFactory;

    function initialize() {
        var numberFactory = new NumberFactory(options);
        var current = Application.getApp().getProperty("rollingAverageDuration").toString();

        var titleText = current;
        var defaults = [numberFactory.getIndex(0)];

        numberTitleText = new WatchUi.Text({:text=>titleText, :locX =>WatchUi.LAYOUT_HALIGN_CENTER, :locY=>WatchUi.LAYOUT_VALIGN_BOTTOM, :color=>Graphics.COLOR_WHITE});

        Picker.initialize({:title=>numberTitleText, :pattern=>[numberFactory], :defaults=>defaults});
    }

    function onUpdate(dc) {
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();
        Picker.onUpdate(dc);
    }
}

class DurationPickerDelegate extends WatchUi.PickerDelegate {
    hidden var hPicker;

    function initialize(picker) {
        PickerDelegate.initialize();
        hPicker = picker;
    }

    function onCancel() {
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        return true;
    }

    function onAccept(values) {
        Application.getApp().setProperty("rollingAverageDuration", values[0]);
        return true;
    }

}