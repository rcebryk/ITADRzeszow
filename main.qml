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
        Menu {
            title: "InnerPage"
            MenuItem {
                text: "Przywróć binding"
                onTriggered: stack.recoverInnerBing()
            }
        }
    }

    statusBar: StatusBar {
        RowLayout {//FIXME dfdfdfd
            anchors.fill: parent
            Label { text: "Stack size: "+stack.depth }
        }
    }

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: anotherBlue
        signal recoverInnerBing

        Component {
            id: view
            Column {
                Component.onCompleted: stack.recoverInnerBing.connect(kolumna.recover)
                KolorowaKolumna {
                    id: kolumna
                    anchors.left: parent.left
                    anchors.right: parent.right
                    function recover() {
                        console.log('Recover called');
                        if(kolumna)
                            kolumna.state="ColorMatched";
                    }
                    Component.onCompleted: kolumna.kolory.push("orange");
                }
                Button {
                    text: "Pierwszy kolor"
                    onClicked: {kolumna.numerKoloru=0;}
                    anchors {
                        left: parent.left
                        right: parent.horizontalCenter
                    }
                }
                Button {
                    text: "Ustaw zielony"
                    onClicked: {
                        kolumna.kolorowyKwadrat.color="green";
                        kolumna.state="default";
                    }
                    anchors {
                        left: parent.horizontalCenter
                        right: parent.right
                    }

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
