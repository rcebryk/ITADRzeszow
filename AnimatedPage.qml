import QtQuick 2.0
import QtQuick.Controls 1.4


Item {
    Button {
        anchors.centerIn: parent
        text: "Start"
        onClicked: {buttonAnimation.start()}
        id: startButton
    }

    SequentialAnimation {
        id: buttonAnimation
        RotationAnimation {
            target: startButton;
            from: 0
            to: 360
        }

    }

}

