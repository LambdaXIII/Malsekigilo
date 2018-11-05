import QtQuick 2.4
import Malsekigilo.Core 1.0

MainContentForm {
    //    MachineCore.flowLevel: switcher.buttonState
    Component.onCompleted: {
        MachineCore.startTimer()
    }

    light.active: switcher.buttonState != MachineCore.Off

    debugText.text: MachineCore.wetPercentText
}
