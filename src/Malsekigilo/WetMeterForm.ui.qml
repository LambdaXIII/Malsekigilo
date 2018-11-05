import QtQuick 2.4

Item {
    id: root
    width: 300
    height: 25
    property alias needleArea: needleArea
    property alias needle: needle

    Rectangle {
        id: meterFrame
        radius: height / 2
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#525252"
            }

            GradientStop {
                position: 1
                color: "#828282"
            }
        }
        border.color: "#b3141414"
        border.width: 4
        anchors.fill: parent

        Item {
            id: needleArea
            anchors.rightMargin: 4
            anchors.leftMargin: 4
            anchors.bottomMargin: 4
            anchors.topMargin: 4
            anchors.fill: parent

            Rectangle {
                id: needle
                x: 135
                width: parent.width * 0.1
                radius: height / 2
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                border.width: 1
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#dc6868"
                    }

                    GradientStop {
                        position: 1
                        color: "#a00000"
                    }
                }
                border.color: "#ffaa04"
            }
        }
    }
}

/*##^## Designer {
    D{i:5;anchors_height:30;anchors_y:0}D{i:1;anchors_height:200;anchors_width:200}
}
 ##^##*/

