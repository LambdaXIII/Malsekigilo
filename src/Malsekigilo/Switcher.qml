import QtQuick 2.4
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.4

SwitcherForm {

    property int buttonState: -1
    property bool isGoingRight: true

    mouseArea.onClicked: {
        if (buttonState != 0) {
            root.state = "CENTER"
            buttonState = 0
        } else {
            if (isGoingRight) {
                root.state = "RIGHT"
                isGoingRight = false
                buttonState = 1
            } else {
                root.state = "LEFT"
                isGoingRight = true
                buttonState = -1
            }
        }
    }

    states: [
        State {
            name: "LEFT"
            PropertyChanges {
                target: button
                x: 0
            }
        },
        State {
            name: "CENTER"
            PropertyChanges {
                target: button
                x: {
                    (buttonArea.width - button.width) / 2
                }
            }
        },
        State {
            name: "RIGHT"
            PropertyChanges {
                target: button
                x: {
                    buttonArea.width - button.width
                }
            }
        }
    ]

    transitions: [
        Transition {

            NumberAnimation {
                target: button
                property: "x"
                duration: 1000
                easing.type: Easing.InOutQuad
            }
        }
    ]
}
