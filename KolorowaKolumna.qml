import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.0


Column {
    id: kolumna
    property int numerKoloru: 0
    property var kolory: ["yellow", "red", "blue"]
    property alias kolorowyKwadrat: kolorowyKwadrat
    
    Rectangle {
        id: kolorowyKwadrat
        color: kolumna.kolory[kolumna.numerKoloru]
        height: 50
        width: 50
    }
    Button {
        text: "Zmien kolor"
        onClicked: {
            kolumna.numerKoloru=(kolumna.numerKoloru+1)%kolumna.kolory.length
        }
    }//TODO somethinf more
}
