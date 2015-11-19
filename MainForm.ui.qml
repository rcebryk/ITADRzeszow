import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {
    id: item1
    width: 640
    height: 480

    property alias button1: myItem1.button1
    property alias button2: myItem1.button2

    MyItem {
        id: myItem1
        anchors.fill: parent
        opacity: 1
    }
}

