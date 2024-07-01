using Toybox.Graphics;
using Toybox.WatchUi;
import Toybox.Lang;

class NumberFactory extends WatchUi.PickerFactory {
    hidden var numberSet as Lang.Array;

    function initialize(inNumberSet as Lang.Array) {
        PickerFactory.initialize();
        numberSet = inNumberSet;
    }

    function getIndex(value) {
        var index = numberSet.indexOf(value);
        return index;
    }

    function getSize() {
        return numberSet.size();
    }

    function getValue(index) {
        return numberSet[index];
    }

   function getDrawable(index, options) {
        var draw = "err";
        if (index != null) {
            draw = index.toString();
        }
        return new WatchUi.Text({
            :text => draw,
            :color => Graphics.COLOR_WHITE,
            :font => Graphics.FONT_LARGE,
            :locX => WatchUi.LAYOUT_HALIGN_CENTER,
            :locY => WatchUi.LAYOUT_VALIGN_CENTER,
        });
    } 
}