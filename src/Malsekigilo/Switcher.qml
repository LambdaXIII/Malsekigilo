import QtQuick 2.4
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.4
import Malsekigilo.Core 1.0

SwitcherForm {

    property int buttonState: MachineCore.Off

    //    property bool isGoingRight: true
    signal stateChanged(int s)

    mouseArea.onClicked: {
        if (buttonState == MachineCore.Off) {
            root.state = "LOW"
            buttonState = MachineCore.Low
        } else if (buttonState == MachineCore.Low) {
            root.state = "MEDIUM"
            buttonState = MachineCore.Medium
        } else if (buttonState == MachineCore.Medium) {
            root.state = "HIGH"
            buttonState = MachineCore.High
        } else if (buttonState == MachineCore.High) {
            root.state = "OFF"
            buttonState = MachineCore.Off
        }
        MachineCore.flowLevel = buttonState
        stateChanged(buttonState)
    }

    states: [
        State {
            name: "OFF"
            PropertyChanges {
                target: button
                x: 0
            }
        },
        State {
            name: "LOW"
            PropertyChanges {
                target: button
                x: {
                    buttonArea.width / 4
                }
            }
        },
        State {
            name: "MEDIUM"
            PropertyChanges {
                target: button
                x: {
                    buttonArea.width / 2
                }
            }
        },
        State {
            name: "HIGH"
            PropertyChanges {
                target: button
                x: {
                    buttonArea.width * 3 / 4
                }
            }
        }
    ]

    transitions: [
        Transition {

            NumberAnimation {
                target: button
                property: "x"
                duration: 800
                easing.type: Easing.InOutSine
            }
        }
    ]
}
