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
            source:"qrc:/icon.PNG" // Adjust path as needed
            width: 25
            height: 25
            fillMode: Image.PreserveAspectFit
            anchors.top: parent.top
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
        }

        focus: true //make sure the window has focus to capture keyboard InputMethod

        // Define a JavaScript function to handle key releases
            function handleKeyRelease(event) {
                modeManager.handleKeyPress(event.key);  // Send key to C++

            }

            // Capture keyboard input and call the JavaScript function
            Keys.onReleased: handleKeyRelease(event)  // Call the function with the event as a parameter


        Rectangle {
            width:modeText.implicitWidth + 20; height:modeText.implicitHeight + 10; radius: 10; color:"#24272C";
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 100

            Text {
                id: modeText
                text: modeManager.mode
                anchors.centerIn: parent
                color: (modeManager.mode === "Battery temperaturer high. Contact Service Center") ? "red"
                     : (modeManager.mode === "REVERSE") ? "yellow"
                     : (modeManager.mode === "HANDBRAKE") ? "red"
                     : (modeManager.mode === "BRAKE FLUIDFLOW") ? "red"
                     : "#49F24F"
                font.pointSize: 24
            }
        }

        Image {
            id: arrow
            source: "qrc:/green-arrow-right-11383.png"
            width: 64
            height: 64
            fillMode: Image.PreserveAspectFit
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.right: parent.right
            anchors.rightMargin: 25
            visible: modeManager.rightArrow
        }

        Image {
            id: arrowleft
            source: "qrc:/green-arrow-left-11383.png" // Adjust path as needed
            width: 64
            height: 64
            fillMode: Image.PreserveAspectFit
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 25
            visible: modeManager.leftArrow

            onStatusChanged: {
                if (status === Image.Error) {
                    console.log("Failed to load image:", source)
                } else if (status === Image.Ready) {
                    console.log("Image loaded successfully.")
                }
            }
        }

        Item {
            width: 400
            height: 400
            anchors.centerIn: parent

            // // ModeManager for managing speed and emitting speed changes
            // Item {
            //     id: modeManager
            //     property int speed: 0  // Current speed
            //     property bool arc: true  // Control visibility of the arc

            //     //signal speedChanged(int newSpeed)  // Signal to notify speed changes

            //     // Function to change speed
            //     function updateSpeed(newSpeed) {
            //         speed = newSpeed;
            //         speedChanged(newSpeed);  // Emit the signal
            //     }
            // }

            // // Timer to automatically increment the speed over time
            // Timer {
            //     id: speedTimer
            //     interval: 200  // Time interval in milliseconds (100 ms = 0.1 sec)
            //     repeat: true  // Repeat the timer indefinitely
            //     running: true  // Start the timer when the app starts

            //     onTriggered: {
            //         // Increase speed gradually and loop back to 0 after reaching maxSpeed
            //         if (modeManager.speed < 100) {
            //             modeManager.updateSpeed(modeManager.speed + 1);  // Increase speed
            //         } else {
            //             modeManager.updateSpeed(0);  // Reset to 0 after reaching maxSpeed
            //         }
            //     }
            // }

            Canvas {
                id: speedArc
                width: 420
                height: 420
                visible: modeManager.arc
                anchors.centerIn: parent

                // Minimum and maximum speed values
                property int minSpeed: 0
                property int maxSpeed: 100

                onPaint: {
                    var ctx = getContext("2d");
                    ctx.clearRect(0, 0, width, height); // Clear previous drawings

                    var centerX = width / 2;
                    var centerY = height;
                    var radius = width / 2 - 20;
                    var startAngle = Math.PI;  // Start from 180 degrees (left)
                    var endAngle = Math.PI * 2;  // End at 360 degrees (right)

                    // Draw the background arc
                    ctx.beginPath();
                    ctx.arc(centerX, centerY, radius, startAngle, endAngle, false);
                    ctx.lineWidth = 20;
                    ctx.strokeStyle = "#24272C"; // Grey background
                    ctx.stroke();

                    // Calculate the speed ratio to determine the arc length
                    var speedRatio = (modeManager.speed - minSpeed) / (maxSpeed - minSpeed);  // Normalize speed
                    var speedEndAngle = startAngle + (speedRatio * Math.PI);  // Calculate filled arc end angle

                    // Draw the filled arc based on speed
                    ctx.beginPath();
                    ctx.arc(centerX, centerY, radius, startAngle, speedEndAngle, false);
                    ctx.lineWidth = 20;
                    ctx.strokeStyle = "white";  // Color for the speed arc
                    ctx.stroke();

                    // Calculate end point of the filled arc
                    var endX = centerX + radius * Math.cos(speedEndAngle);
                    var endY = centerY + radius * Math.sin(speedEndAngle);

                    // Calculate rotation angle (perpendicular to the arc)
                    var rotationAngle = speedEndAngle + Math.PI / 2; // Add 90 degrees to get perpendicular direction

                    // Draw the rounded rectangle at the end of the arc
                    var rectWidth = 6; // Increased width of the rectangle
                    var rectHeight = 80; // Increased height of the rectangle
                    var radiusCorners = 6; // Radius for rounded corners

                    ctx.save(); // Save the current state
                    ctx.translate(endX, endY); // Move to the end of the arc
                    ctx.rotate(rotationAngle); // Rotate to the calculated angle

                    // Draw a rounded rectangle
                    ctx.beginPath();
                    ctx.moveTo(-rectWidth / 2 + radiusCorners, -rectHeight / 2); // Move to the starting point
                    ctx.lineTo(rectWidth / 2 - radiusCorners, -rectHeight / 2); // Top edge
                    ctx.quadraticCurveTo(rectWidth / 2, -rectHeight / 2, rectWidth / 2, -rectHeight / 2 + radiusCorners); // Top-right corner
                    ctx.lineTo(rectWidth / 2, rectHeight / 2 - radiusCorners); // Right edge
                    ctx.quadraticCurveTo(rectWidth / 2, rectHeight / 2, rectWidth / 2 - radiusCorners, rectHeight / 2); // Bottom-right corner
                    ctx.lineTo(-rectWidth / 2 + radiusCorners, rectHeight / 2); // Bottom edge
                    ctx.quadraticCurveTo(-rectWidth / 2, rectHeight / 2, -rectWidth / 2, rectHeight / 2 - radiusCorners); // Bottom-left corner
                    ctx.lineTo(-rectWidth / 2, -rectHeight / 2 + radiusCorners); // Left edge
                    ctx.quadraticCurveTo(-rectWidth / 2, -rectHeight / 2, -rectWidth / 2 + radiusCorners, -rectHeight / 2); // Top-left corner
                    ctx.closePath();
                    ctx.fillStyle = "white"; // Color of the rectangle
                    ctx.fill(); // Fill the rounded rectangle

                    ctx.restore(); // Restore the state to avoid affecting other drawings
                }

                // Repaint the arc whenever the speed changes
                Connections {
                    target: modeManager
                    function onSpeedChanged(newSpeed) {
                        console.log("Speed changed to:", newSpeed);
                        speedArc.requestPaint(); // Request a repaint to reflect the speed change
                    }
                }
            }

        }

        // Text in the middle to display the speed
        Text {
            id: speedText
            text: modeManager.speed  // You can bind this dynamically to the backend
            font.pixelSize: 100
            color: (modeManager.mode === "REVERSE") ? "yellow" : "white"
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
            source:"qrc:/battery_grey.PNG" // Adjust path as needed
            width: 35
            height: 25
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: temperatureSection.top
            anchors.topMargin: 50
        }

        Image {
            id: engine
            source:"qrc:/engine.PNG" // Adjust path as needed
            width: 35
            height: 25
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: temperatureSection.top
            anchors.topMargin: 95
        }

        Image {
            id: controller
            source:"qrc:/controller.PNG" // Adjust path as needed
            width: 30
            height: 30
            anchors.left: parent.left
            anchors.leftMargin: 23
            anchors.top: temperatureSection.top
            anchors.topMargin: 140
        }

        // Temperature Indicators
        Column {
            id: temperatureSection
            anchors.left: parent.left
            anchors.leftMargin: 60
            anchors.verticalCenter: parent.verticalCenter
            spacing: 30

            Text { text: "Vehicle Temperature"; color: "gray"; font.pointSize: 14; font.bold: true }

            Rectangle {
                width: 140; height: 16; radius: 15; color: "#24272C"
                Rectangle {
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    width: modeManager.progressValue; height: 8; radius: 10
                    color: "#FD0003"  // Set the bar color dynamically
                }
            }

            Rectangle {
                width: 140; height: 16; radius: 15; color: "#24272C"
                Rectangle {
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    width: 40; height: 8; radius: 10
                    color: "#FD0003"  // Set the bar color dynamically
                }
            }
            Rectangle {
                width: 140; height: 16; radius: 15; color: "#24272C"
                Rectangle {
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    width: 80; height: 8; radius: 10
                    color: "#FD0003"  // Set the bar color dynamically
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
                source:"qrc:/battery_grey.PNG"
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
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.verticalCenter: parent.verticalCenter
                    width: modeManager.battHealth * 2; height: 15; radius: 8
                    color: (modeManager.battHealth !== 5) ? "#49F24F" : "red"  // Battery level bar
                }
            }

            Text { text: modeManager.battHealth + "%"; color: (modeManager.battHealth !== 5) ? "white" : "red"; font.pointSize: 14 }  // Percentage, dynamically set from C++
        }
    }
}
