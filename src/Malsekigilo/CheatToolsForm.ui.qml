import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Item {
    id: item1
    width: 150
    height: 400
    property alias exitButton: exitButton
    property alias to90: to90
    property alias to10: to10
    property alias minus30: minus30
    property alias plus30: plus30
    property alias minus10: minus10
    property alias plus10: plus10
    property alias speedSpin: speedSpin

    Rectangle {
        id: rectangle
        radius: 15
        border.width: 0
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#80fc9a9a"
            }

            GradientStop {
                position: 1
                color: "#80035e97"
            }
        }
        anchors.fill: parent
        z: -1
    }

    ScrollView {
        id: scrollView
        anchors.rightMargin: 5
        anchors.leftMargin: 5
        anchors.bottomMargin: 5
        anchors.topMargin: 5
        anchors.fill: parent

        ColumnLayout {
            id: columnLayout
            anchors.fill: parent
            spacing: 3

            Label {
                id: label
                text: qsTr("CheatTools")
                Layout.fillWidth: true
            }

            SpinBox {
                id: speedSpin
                Layout.fillWidth: true
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0
                to: 10
                from: 0
                value: 1
            }

            Button {
                id: plus10
                text: qsTr("+ 10 %")
                Layout.fillWidth: true
                display: AbstractButton.TextOnly
            }

            Button {
                id: minus10
                text: qsTr("- 10 %")
                Layout.fillWidth: true
                display: AbstractButton.TextOnly
            }

            Button {
                id: plus30
                text: qsTr("+ 30 %")
                Layout.fillWidth: true
                display: AbstractButton.TextOnly
            }

            Button {
                id: minus30
                text: qsTr("- 30 %")
                Layout.fillWidth: true
                display: AbstractButton.TextOnly
            }

            Button {
                id: to10
                text: qsTr("= 10 %")
                Layout.fillWidth: true
                display: AbstractButton.TextOnly
            }

            Button {
                id: to90
                text: qsTr("= 90 %")
                Layout.fillWidth: true
                display: AbstractButton.TextOnly
            }
        }
    }

    RoundButton {
        id: exitButton
        width: 15
        height: 15
        text: "-"
        z: 5
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
    }
}


/*##^## Designer {
    D{i:7;anchors_height:200;anchors_width:200;anchors_x:-12;anchors_y:-34}D{i:22;anchors_y:13}
D{i:24;anchors_height:100;anchors_width:100}D{i:31;anchors_height:200;anchors_width:200}
D{i:33;anchors_width:15}
}
 ##^##*/
