import QtQuick 2.4
import Malsekigilo.Core 1.0

MainContentForm {
    //    MachineCore.flowLevel: switcher.buttonState
    Component.onCompleted: {
        MachineCore.startTimer()
    }
    clip: true

    light.active: switcher.buttonState != MachineCore.Off

    gauge.value: MachineCore.wetPercent

    digitalBox.currentValue: MachineCore.wetPercent
}
