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
                onTriggered: stack.push({"item":view, "replace":replaceChecked.checked})
            }
            MenuItem {
                text: "Back"
                onTriggered: stack.pop()
            }
            MenuItem {
                id: replaceChecked
                text: "Replace"
                checkable: true
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
                    id: pierwszyKolor
                    onClicked: {kolumna.numerKoloru=0;}
                    anchors {
                        left: parent.left
                        right: parent.horizontalCenter
                    }
                }
                Item {
                    width: parent.width
                    height: pierwszyKolor.height
                    Button {
                        text: "Ustaw zielony"
                        onClicked: {
                            kolumna.kolorowyKwadrat.color="green";
                            kolumna.state="default";
                        }
                        anchors {
                            left: parent.horizontalCenter
                            right: parent.right
                            top: parent.top
                            bottom: parent.bottom
                        }

                    }

                    Button {
                        text: "Otwórz animacje"
                        property Component animatedPage: AnimatedPage {}
                        onClicked: {
                            stack.push(animatedPage);
                        }
                        anchors {
                            left: parent.left
                            right: parent.horizontalCenter
                            top: parent.top
                            bottom: parent.bottom
                        }

                    }
                }
            }
        }
        Component {
            id: anotherBlue
            Rectangle {
                Label {
                    id: dateTimeLabel
                    anchors.centerIn: parent
                    text: ""+currentDateTime
                    color: "yellow"
                }
                Label {
                    anchors.top: dateTimeLabel.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: worker.name
                    color: "yellow"
                }

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
