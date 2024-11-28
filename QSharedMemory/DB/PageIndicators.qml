import QtQuick 2.15
import QtQuick.Controls 2.15

PageIndicator {
    id: pageIndicator
    count: swipeView.count
    currentIndex: swipeView.currentIndex
    interactive: false // Disable internal interaction
    anchors.verticalCenter: parent.verticalCenter  // Center vertically
    opacity: 1.0  // Ensure visibility

    // Mouse area to handle page switching
    MouseArea {
        anchors.fill: parent
        onClicked: {
            swipeView.currentIndex = Math.floor(mouse.x / (width / pageIndicator.count)); // Calculate the index based on the mouse position
        }
    }
}
