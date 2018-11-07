import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4

Gauge {
    //    id: root
    FontLoader {
        id: digitalFont
        source: "qrc:/fonts/digigraphics.ttf"
    }
    font.family: digitalFont.name
    font.pixelSize: 10
    Behavior on value {
        NumberAnimation {
            duration: 2800
            easing.type: Easing.InOutQuart
        }
    }

    style: GaugeStyle {
        valueBar: Rectangle {
            implicitWidth: 28
            color: Qt.rgba(1 - gauge.value / gauge.maximumValue, 0,
                           gauge.value / gauge.maximumValue,
                           gauge.value / gauge.maximumValue + 0.3)
        }
        tickmark: Item {
            implicitWidth: 8
            implicitHeight: 4

            Rectangle {
                x: control.tickmarkAlignment === Qt.AlignLeft
                   || control.tickmarkAlignment === Qt.AlignTop ? parent.implicitWidth : -28
                width: 14
                height: parent.height
                color: "lightgrey"
            }
        }
        minorTickmark: Item {
            implicitWidth: 8
            implicitHeight: 2

            Rectangle {
                x: control.tickmarkAlignment === Qt.AlignLeft
                   || control.tickmarkAlignment === Qt.AlignTop ? parent.implicitWidth : -28
                width: 7
                height: parent.height
                color: "lightgrey"
            }
        }
    }
}
