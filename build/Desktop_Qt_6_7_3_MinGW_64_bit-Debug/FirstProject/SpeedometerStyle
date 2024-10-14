import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Item {
    id: speedometer
    width: 300
    height: 300

    // Background for the speedometer
    Rectangle {
        width: parent.width
        height: parent.height
        color: "#2B2F36"
        radius: width / 2
    }

    // Speedometer arc
    Shape {
        width: parent.width
        height: parent.height
        anchors.centerIn: parent

        ShapePath {
            strokeColor: "white"
            strokeWidth: 10
            fillColor: "transparent"

            startX: width / 2
            startY: height / 2

            PathArc {
                x: width / 2
                y: height / 2
                radiusX: width / 2 - 20
                radiusY: height / 2 - 20
                startAngle: -90
                sweepAngle: 180  // Adjust this for a half-circle speedometer
            }
        }
    }

    // Speed text in the middle
    Text {
        id: speedText
        text: "36"  // Replace with a dynamic value later
        font.pixelSize: 64
        color: "white"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    // Needle indicator
    Rectangle {
        width: 4
        height: 120
        color: "red"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.verticalCenter
        rotation: 90 + (backend.speed * 1.8)  // Dynamically update the rotation based on speed
        transformOrigin: Item.Bottom
    }
}
