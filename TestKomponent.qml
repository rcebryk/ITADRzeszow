import QtQuick 2.5
import QtQuick.Controls 1.4

Item {

    property bool state2Enabled : checkBox2.checked

    Column {
        id: column1
        width: 200
        height: 400
        spacing: 8

        Label {
            id: label1
            text: qsTr("Hello World")
        }

        CheckBox {
            id: checkBox1
            text: qsTr("Check Box")
            checked: true
        }

        CheckBox {
            id: checkBox2
            text: qsTr("Check Box")
            checked: false
        }


    }
    states: [
        State {
            name: "State1"
            when: checkBox1.checked

            PropertyChanges {
                target: label1
                text: qsTr("Siemano")
            }
        },
        State {
            name: "State2"
            when: state2Enabled

            PropertyChanges {
                target: label1
                text: qsTr("cYa")
            }
        }
    ]
}

