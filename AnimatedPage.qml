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

    Button {
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Start action"
        onClicked: worker.start();

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

        PropertyAnimation {
            target: startButton
            property: "width"
            duration: 2000
            easing.type: Easing.InOutQuad
            to: 2*startButton.width
        }

        PropertyAnimation {
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

        PropertyAnimation {
            target: startButton
            property: "height"
            duration: 200
            easing.type: Easing.InOutQuad
            to: 2*startButton.height
        }

        PropertyAnimation {
            target: startButton
            property: "height"
            duration: 200
            easing.type: Easing.InOutQuad
            to: startButton.height
        }



    }

}

