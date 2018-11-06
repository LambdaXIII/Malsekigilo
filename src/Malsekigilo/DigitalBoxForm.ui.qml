import QtQuick 2.4

Item {
    id: root
    width: 200
    height: 200
    property alias root: root
    property alias backBox: backBox
    property alias digitText: digitText

    Rectangle {
        id: backBox
        color: "#690000"
        radius: 8
        border.width: 0
        anchors.fill: parent
    }

    Text {
        id: digitText
        color: "#ffffff"
        text: qsTr("100.99%")
        font.family: "Arial"
        anchors.rightMargin: 8
        anchors.leftMargin: 8
        anchors.bottomMargin: 8
        anchors.topMargin: 8
        font.pixelSize: 30
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        anchors.fill: parent
    }
}


/*##^## Designer {
    D{i:1;anchors_height:200;anchors_width:200;anchors_x:127;anchors_y:125}
}
 ##^##*/
