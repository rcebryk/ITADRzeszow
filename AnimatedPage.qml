import QtQuick 2.0
import QtQuick.Controls 1.4


Item {
    Button {
        anchors.centerIn: parent
        text: "Start"
        onClicked: {buttonAnimation.complete();buttonAnimation.start();}
        id: startButton
        width: 50
    }

    SequentialAnimation {
        id: buttonAnimation
        loops: Animation.Infinite
        RotationAnimation {
            target: startButton;
            from: 0
            to: 360
            properties: "rotation"
        }

        NumberAnimation {
            target: startButton
            property: "width"
            duration: 200
            easing.type: Easing.InOutQuad
            to: 2*startButton.width
        }

        NumberAnimation {
            target: startButton
            property: "width"
            duration: 200
            easing.type: Easing.InOutQuad
            to: startButton.width
        }

        RotationAnimation {
            target: startButton;
            to: 0
            properties: "rotation"
        }

        NumberAnimation {
            target: startButton
            property: "height"
            duration: 200
            easing.type: Easing.InOutQuad
            to: 2*startButton.height
        }

        NumberAnimation {
            target: startButton
            property: "height"
            duration: 200
            easing.type: Easing.InOutQuad
            to: startButton.height
        }



    }

}

