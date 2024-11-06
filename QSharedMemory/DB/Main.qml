import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    id: root
    visible: true
    height: 480
    width: 680
    title: qsTr("Person Manager")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        width: 680

        // Screen: 1 Add data Screen
        Item {
            id: addScreen1
            PersonForm {
                width: parent.width
            }
        }

        // Screen 2: List and the Delete data screen.
        Item {
            id: addScreen2
            PersonList {
                width: parent.width
            }
        }
    }
    // Page indicator to navigate between screens
       PageIndicators {
           anchors.bottom: parent.bottom
           anchors.bottomMargin: 470
           anchors.horizontalCenter: parent.horizontalCenter
       }
}

