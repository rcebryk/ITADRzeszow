import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.0


ApplicationWindow {
    visible: true
    width: 640
    height: 480
    menuBar: MenuBar {
        Menu {
            title: "WindowStack"
            MenuItem {
                text: "OpenRed"
                /*!
                  @NOTE: nottt
                  */
                //NOTE dupa
                onTriggered: stack.push(anotherRed)
            }
            MenuItem {
                text: "OpenBlue"
                onTriggered: stack.push(anotherBlue)
            }
            MenuItem {
                text: "OpenDefault"
                //TODO taz
                onTriggered: stack.push(view)
            }
            MenuItem {
                text: "Back"
                onTriggered: stack.pop()
            }
        }
    }

    statusBar: StatusBar {
        RowLayout {
            anchors.fill: parent
            Label { text: "Stack size: "+stack.depth }
        }
    }

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: anotherBlue

        Component {
            id: view
            //TODO no confirmation needed?
            Column {
                Label { text: "TEXT" }
                MouseArea {
                    Text {
                        text: stack.depth
                        anchors.centerIn: parent
                    }
                    //FIXME poprawka
                    onClicked: stack.push(view)
                }
            }
        }

        Component {
            id: anotherBlue
            Rectangle {
                color: "blue"
                width: 100
                height: 100
            }
        }

        Component {
            id: anotherRed
            Rectangle {
                color: "red"
            }
        }
    }
}
