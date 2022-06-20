import Toybox.Activity;
import Toybox.Lang;
import Toybox.Time;
import Toybox.WatchUi;

class PercentRemaining extends WatchUi.SimpleDataField {

    function initialize() 
    {
        SimpleDataField.initialize();
        label = Application.loadResource(Rez.Strings.FieldTitle);
    }

    function compute(info as Activity.Info) as Numeric or Duration or String or Null 
    {
        if (info.distanceToDestination != null and info.distanceToDestination > 0)
        {
            return (100.0 - (info.elapsedDistance / (info.elapsedDistance + info.distanceToDestination) * 100)).format("%0.1f") + "%";
        }
        return "--";
    }

}