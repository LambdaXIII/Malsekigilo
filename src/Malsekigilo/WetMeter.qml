import QtQuick 2.4
import Malsekigilo.Core 1.0

WetMeterForm {
    property double percent: 50

    //    needle.x: (needleArea.width - needle.width) * percent / 100
    onPercentChanged: {
        xAnimation.from = needle.x
        xAnimation.to = (needleArea.width - needle.width) * percent / 100
        xAnimation.running = true
    }
    NumberAnimation {
        id: xAnimation
        target: needle
        property: "x"
        duration: 800
        easing.type: Easing.InOutSine
    }
}
