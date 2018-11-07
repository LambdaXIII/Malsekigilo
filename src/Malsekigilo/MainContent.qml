import QtQuick 2.4
import Malsekigilo.Core 1.0

MainContentForm {
    //    MachineCore.flowLevel: switcher.buttonState
    Component.onCompleted: {
        MachineCore.startTimer()
    }
    clip: true

    FontLoader {
        id: digitalFont
        source: "qrc:/fonts/digigraphics.ttf"
    }
    light.active: switcher.buttonState != MachineCore.Off

    gauge.value: MachineCore.wetPercent

    gauge.font.family: digitalFont.name
    gauge.font.pixelSize: 10
    digitalBox.currentValue: MachineCore.wetPercent
}
