import QtQuick 2.4
import QtQuick.Extras 1.4
import QtQuick.Controls 2.3

Item {
    id: root
    width: 400
    height: 400
    property alias gauge: gauge
    property alias digitalBox: digitalBox
    property alias root: root
    property alias light: light
    property alias switcher: switcher

    Switcher {
        id: switcher
        x: 201
        y: 307
        width: 191
        height: 29
        anchors.verticalCenter: light.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 8
    }

    StatusIndicator {
        id: light
        y: 326
        color: "#39990b"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 28
        anchors.left: parent.left
        anchors.leftMargin: 32
    }

    DigitalBox {
        id: digitalBox
        x: 248
        width: 144
        height: 42
        anchors.right: parent.right
        anchors.rightMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 28
    }

    Rectangle {
        id: rectangle
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#a9a9a9"
            }

            GradientStop {
                position: 0.086
                color: "#868686"
            }

            GradientStop {
                position: 0.925
                color: "#4d4d4d"
            }

            GradientStop {
                position: 1
                color: "#3b3b3b"
            }
        }
        anchors.fill: parent
        z: -10
    }

    StyledGauge {
        id: gauge
        width: 53
        anchors.bottom: light.top
        anchors.bottomMargin: 8
        anchors.left: parent.left
        anchors.leftMargin: 8
        anchors.top: parent.top
        anchors.topMargin: 28
    }
}


/*##^## Designer {
    D{i:1;anchors_width:191;anchors_x:201}D{i:2;anchors_x:32}D{i:10;anchors_x:8;anchors_y:8}
D{i:11;anchors_height:306;anchors_x:11;anchors_y:28}
}
 ##^##*/
