import QtQuick 2.4
import QtQuick.Extras 1.4
import QtQuick.Controls 2.3

Item {
    width: 400
    height: 400
    property alias setToTen: setToTen
    property alias setToNinty: setToNinty
    property alias wetMeter: wetMeter
    property alias debugText: debugText
    property alias light: light
    property alias switcher: switcher

    Switcher {
        id: switcher
        x: 46
        y: 305
        width: 309
        height: 29
    }

    StatusIndicator {
        id: light
        x: 43
        y: 267
        color: "#39990b"
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

    WetMeter {
        id: wetMeter
        x: 92
        y: 270
        width: 260
        height: 25
    }

    Button {
        id: setToTen
        x: 220
        y: 204
        width: 64
        height: 40
        text: qsTr("10%")
    }

    Button {
        id: setToNinty
        x: 294
        y: 204
        width: 51
        height: 40
        text: qsTr("90%")
    }
}
