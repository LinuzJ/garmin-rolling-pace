using Toybox.Graphics;
using Toybox.WatchUi;

class NumberFactory extends WatchUi.PickerFactory {
    hidden var numberSet;

    function initialize(inNumberSet as Lang.Array) {
        PickerFactory.initialize();
        numberSet = inNumberSet;
    }

    function getIndex(value) {
        var index = numberSet.find(value);
        return index;
    }

    function getSize() {
        return numberSet.length();
    }

    function getValue(index) {
        return numberSet[index];
    }

   function getDrawable(index, options) {
        var draw = "x";
        if (index != null) {
            draw = index.toString();
        }
        return new WatchUi.Text({
            :text => getValue(draw).toString(),
            :color => Graphics.COLOR_WHITE,
            :font => Graphics.FONT_LARGE,
            :locX => WatchUi.LAYOUT_HALIGN_CENTER,
            :locY => WatchUi.LAYOUT_VALIGN_CENTER,
        });
    } 
}