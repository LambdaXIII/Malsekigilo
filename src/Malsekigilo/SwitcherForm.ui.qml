import QtQuick 2.4

Item {
    id: root
    width: 400
    height: 400
    property alias root: root
    property alias buttonArea: buttonArea
    property alias button: button
    property alias mouseArea: mouseArea

    Rectangle {
        id: back
        x: 4
        y: 4
        radius: 10
        z: -1
        border.color: "#803d3d3d"
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#121212"
            }

            GradientStop {
                position: 0.205
                color: "#343434"
            }

            GradientStop {
                position: 0.827
                color: "#2d2d2d"
            }

            GradientStop {
                position: 1
                color: "#595959"
            }
        }
        border.width: 4

        Item {
            id: buttonArea
            clip: true
            anchors.rightMargin: 4
            anchors.leftMargin: 4
            anchors.bottomMargin: 4
            anchors.topMargin: 4
            anchors.fill: parent

            Rectangle {
                id: button
                y: 0
                width: parent.width / 4
                height: parent.height
                radius: 5
                clip: false
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: "#e9e9e9"
                    }

                    GradientStop {
                        position: 0.17
                        color: "#d2d2d2"
                    }

                    GradientStop {
                        position: 0.836
                        color: "#ababab"
                    }

                    GradientStop {
                        position: 1
                        color: "#828282"
                    }
                }
                z: 2
                border.color: "#000000"
                border.width: 2

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                }
            }
        }
    }
}


/*##^## Designer {
    D{i:11;anchors_height:200;anchors_width:200;anchors_x:93;anchors_y:107}D{i:1;anchors_height:200;anchors_width:200;anchors_x:48;anchors_y:105}
}
 ##^##*/
