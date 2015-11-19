import QtQuick 2.0


GridLayout1 {
    id: gridLayout1
    property bool stateOneEnabled: false
    states: [
        State {
            name: "State1"
            when: stateOneEnabled

            PropertyChanges {
                target: sliderVertical1
                rotation: 112
            }

        },
        State {
            name: "State2"
            when: !stateOneEnabled

        }
    ]



    button3.onClicked: stateOneEnabled = !stateOneEnabled;
}
