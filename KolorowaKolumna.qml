import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.0


Column {
    id: kolumna
    z: 1
    property int numerKoloru: 0
    property var kolory: ["yellow", "red", "blue", "purple"]
    property alias kolorowyKwadrat: kolorowyKwadrat

    Rectangle {
        id: kolorowyKwadrat
        color: kolumna.kolory[kolumna.numerKoloru]
        height: 50
        width: parent.width
    }
    Button {
        text: "Zmien kolor"
        onClicked: {
            kolumna.numerKoloru=(kolumna.numerKoloru+1)%kolumna.kolory.length
        }
        width: parent.width
    }
    states: [
        State {
            name: "ColorMatched"
            PropertyChanges {
                target: kolorowyKwadrat
                color: kolumna.kolory[kolumna.numerKoloru]
            }

        }
    ]//TODO somethinf more
}
