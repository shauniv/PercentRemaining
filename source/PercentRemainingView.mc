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
        var elapsedDistance = 0.0;
        if (info.elapsedDistance != null)
        {
            elapsedDistance = info.elapsedDistance;
        }
        if (info.distanceToDestination != null and info.distanceToDestination > 0)
        {
            if (elapsedDistance + info.distanceToDestination > 0)
            {
                return (100.0 - (elapsedDistance / (elapsedDistance + info.distanceToDestination) * 100)).format("%0.1f") + "%";
            }
        }
        return "--";
    }

}