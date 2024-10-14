import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Shapes 1.15

ApplicationWindow {
    id: root
    visible: true
    width: 800
    height: 600
    title: qsTr("Car Dashboard")


    // Background
    Rectangle {
        anchors.fill: parent
        color: "#2B2F36"  // Dark background color
        Image {
            id: myImage
            source:"file:///C:/Users/Admin/Documents/FirstProject/icon.PNG" // Adjust path as needed
            width: 25
            height: 25
            fillMode: Image.PreserveAspectFit
            anchors.top: parent.top
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter

            onStatusChanged: {
                if (status === Image.Error) {
                    console.log("Failed to load image:", source)
                } else if (status === Image.Ready) {
                    console.log("Image loaded successfully.")
                }
            }
        }

        Rectangle {
            width: 200; height:50; radius: 10; color:"#24272C";
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 100

            Text {
                id: mode
                text: qsTr("ECO MODE")
                anchors.centerIn: parent
                color: "#49F24F"
                font.pointSize: 24
            }
        }

        Image {
            id: arrow
            source:"file:///C:/Users/Admin/Documents/FirstProject/green-arrow-right-11383.PNG" // Adjust path as needed
            width: 64
            height: 64
            fillMode: Image.PreserveAspectFit
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.right: parent.right
            anchors.rightMargin: 25
        }
        // Speedometer
        Item {
            anchors.centerIn: parent
            width: 400
            height: 400

            //Arc to simulate the gauge using Canvas
            Canvas {
                id: gaugeCanvas
                width: 420
                height: 420

                anchors.centerIn: parent

                onPaint: {
                    var ctx = getContext("2d");
                    ctx.clearRect(0, 0, width, height);

                    // Draw the outer arc
                    ctx.beginPath();
                    ctx.arc(width / 2, height, width / 2 - 20, Math.PI, 2 * Math.PI, false);
                    ctx.lineWidth = 20;
                    ctx.strokeStyle = "grey";
                    ctx.stroke();
                }
            }
        }
        // Text in the middle to display the speed
        Text {
            id: speedText
            text: "36"  // You can bind this dynamically to the backend
            font.pixelSize: 100
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 110
        }

        Text {
            id: speedTextUnit
            text: "km/hr"
            font.pixelSize: 18
            color: "white"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
        }

        Image {
            id: battery_grey
            source:"file:///C:/Users/Admin/Documents/FirstProject/battery_grey.PNG" // Adjust path as needed
            width: 35
            height: 25
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 265
        }

        Image {
            id: engine
            source:"file:///C:/Users/Admin/Documents/FirstProject/engine.PNG" // Adjust path as needed
            width: 35
            height: 25
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 315
        }

        Image {
            id: controller
            source:"file:///C:/Users/Admin/Documents/FirstProject/controller.PNG" // Adjust path as needed
            width: 30
            height: 30
            anchors.left: parent.left
            anchors.leftMargin: 23
            anchors.top: parent.top
            anchors.topMargin: 362
        }

        // Temperature Indicators
        Column {
            id: temperatureSection
            anchors.left: parent.left
            anchors.leftMargin: 60
            anchors.verticalCenter: parent.verticalCenter
            spacing: 30

            Text { text: "Vehicle Temperature"; color: "gray"; font.pointSize: 14; font.bold: true }

            Repeater {
                model: 3
                Rectangle {
                    width: 140; height: 20; radius: 15; color: "#24272C"
                    Rectangle {
                        anchors.left: parent.left
                        anchors.leftMargin: 5
                        anchors.verticalCenter: parent.verticalCenter
                        width: 120; height: 10; radius: 10
                        color: "#FD0003"  // Set the bar color dynamically
                    }
                }
            }
        }

        // TTC, Odo, and DTE Info
        Column {
            anchors.right: parent.right
            //anchors.rightMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            spacing: 10

            Rectangle {
                width: 200; height: 30; radius: 5; color: "#24272C"
                Row {
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    Text { text: "TTC "; color: "gray"; font.pointSize: 14; font.bold: true }
                    Text { text: "5 Hours"; color: "white"; font.pointSize: 14; font.bold: true }  // Dynamically set from C++
                }
            }

            Rectangle {
                width: 200; height: 30; radius: 5; color: "#24272C"
                Row {
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    Text { text: "Odo "; color: "gray"; font.pointSize: 14; font.bold: true }
                    Text { text: "18,500 KM"; color: "white"; font.pointSize: 14; font.bold: true }  // Dynamically set from C++
                }
            }

            Rectangle {
                width: 200; height: 30; radius: 5; color: "#24272C"
                Row {
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    Text { text: "DTE "; color: "gray"; font.pointSize: 14; font.bold: true }
                    Text { text: "120 KM"; color: "white"; font.pointSize: 14; font.bold: true }  // Dynamically set from C++
                }
            }
        }

        // Battery Level and Voltage
        Row {
            id: batterySection
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            spacing: 10

            Text { text: "140V"; color: "white"; font.pointSize: 14 }  // Voltage

            Image {
                source:"file:///C:/Users/Admin/Documents/FirstProject/battery_grey.PNG"
                width: 26
                height: 16
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 7
            }

            Rectangle {
                id: batteryBarRectangle
                width: 210; height: 24; radius: 12
                color: "#24272C"  // Battery level bar
                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    width: 200; height: 15; radius: 8
                    color: "#49F24F"  // Battery level bar
                }
            }

            Text { text: "100%"; color: "white"; font.pointSize: 14 }  // Percentage, dynamically set from C++
        }
    }
}
