import QtQuick 2.4
import QtQuick.Extras 1.4

Item {
    width: 400
    height: 400
    property alias debugText: debugText
    property alias light: light
    property alias switcher: switcher

    Switcher {
        id: switcher
        x: 37
        y: 342
        width: 326
        height: 40
    }

    StatusIndicator {
        id: light
        x: 50
        y: 63
    }

    Text {
        id: debugText
        x: 84
        y: 148
        width: 236
        height: 104
        text: qsTr("Text")
        font.family: "Times New Roman"
        renderType: Text.NativeRendering
        font.pixelSize: 28
    }
}
