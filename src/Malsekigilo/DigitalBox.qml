import QtQuick 2.4

DigitalBoxForm {

    property double currentValue: 0
    property double displayValue: 0

    onCurrentValueChanged: {
        if (!numberAnimation.running) {
            numberAnimation.to = currentValue
            numberAnimation.running = true
        }
    }

    FontLoader {
        id: digitalFont
        source: "qrc:/fonts/digigraphics.ttf"
    }
    digitText.font.family: digitalFont.name

    //    onDisplayValueChanged: {
    //        digitText.text = displayValue.toString()

    //        switch (displayValue) {
    //        case 9:
    //            digitText.color = "white"
    //            backBox.color = "grey"
    //            backBox.visible = true
    //            break
    //        case 0:
    //            digitText.color = "white"
    //            backBox.color = "darkred"
    //            backBox.visible = true
    //            break
    //        default:
    //            digitText.color = "grey"
    //            backBox.visible = false
    //        }
    //    }
    digitText.text: parseFloat(displayValue).toFixed(2).toString() + '%'

    NumberAnimation {
        id: numberAnimation
        property: "displayValue"
        target: root
        duration: 2800
        easing.type: Easing.InOutQuad
    }
}
