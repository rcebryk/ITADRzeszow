import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

GridLayout {

    property alias button1 : button1
    property alias button2 : button2
    property alias button3 : button3
    property alias sliderVertical1 : sliderVertical1
    id: gridLayout1
    x: 25
    y: 25
    anchors.rightMargin: 25
    anchors.leftMargin: 25
    anchors.bottomMargin: 25
    anchors.topMargin: 25
    anchors.fill: parent
    rows: 2
    columns: 2
    
    Button {
        id: button1
        text: qsTr("Press Me 1")
    }
    
    Button {
        id: button2
        text: qsTr("Press Me 2")
    }
    
    TextArea {
        id: textArea1
        text: gridLayout1.state
    }

    MyRotationAnimation {
                        target: gridLayout1
                        duration: 100000
                        to: 360
                        loops: -1
                        running: true
    }
    
    Slider {
        id: sliderVertical1
        tickmarksEnabled: true
        clip: false
        antialiasing: true
        transformOrigin: Item.Center
        scale: 1
        rotation: 12
        orientation: Qt.Horizontal
    }
    
    Button {
        id: button3
        text: qsTr("Button")
        z: 1
    }

    transitions: [
        Transition {
            from: "State1"
            to: "State2"
            animations: MyRotationAnimation {
                    target: sliderVertical1
            }
        }
    ]
}
