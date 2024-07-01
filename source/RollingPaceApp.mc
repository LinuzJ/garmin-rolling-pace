import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;


class RollingPaceApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state as Dictionary?) as Void {
    }

    function onStop(state as Dictionary?) as Void {
    }

    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [ new RollingPaceView() ];
    }

    function getSettingsView() {
        return [ new AppSettingsView(), new AppSettingsDelegate() ];
    }

}

function getApp() as RollingPaceApp {
    return Application.getApp() as RollingPaceApp;
}