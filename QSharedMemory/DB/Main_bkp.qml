import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
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
            id: addScreen
            Column {
                spacing: 10

                TextField {
                    id: nameField
                    placeholderText: "Enter Name"
                }

                TextField {
                    id: ageField
                    placeholderText: "Enter Age"
                    inputMethodHints: Qt.ImhDigitsOnly
                }

                ComboBox {
                    id: genderField
                    model: ["Male", "Female", "Other"]
                    currentIndex: 0
                }

                TextField {
                    id: idField
                    placeholderText: "Enter ID"
                    inputMethodHints: Qt.ImhDigitsOnly
                }

                Button {
                    text: "Submit"
                    onClicked: {
                        dbManager.addPerson(nameField.text, parseInt(ageField.text), genderField.currentText, parseInt(idField.text))
                        personModel.updateModel()  // Update the ListView after adding the data
                        nameField.text = ""
                        ageField.text = ""
                        idField.text = ""
                    }
                }
            }
            // Image element to display the logo
            Rectangle {
                width: 156  // Set the desired width of the container
                height: 156  // Set the desired height of the container
                border.color: "black"  // Set the border color
                border.width: 1  // Set the border width
                radius: 4  // Optional: Round the corners
                color: "transparent"  // Make the background of the rectangle transparent
                anchors.horizontalCenter: parent.horizontalCenter // Center the image
                anchors.verticalCenter: parent.verticalCenter

                Image {
                    id: logoImage
                    source: "person_manager_logo.png" // Relative path to your image
                    width: 150 // Set the desired width
                    height: 150 // Set the desired height
                    fillMode: Image.PreserveAspectFit // Maintain aspect ratio
                    anchors.top: parent.top
                    anchors.topMargin: 4 // Center the image
                    anchors.left: parent.left
                    anchors.leftMargin: 4
                    //anchors.verticalCenter: parent
                }
            }
        }

        // Screen 2: List and the Delete data screen.
        Item {
            id: listScreen
            Column {
                id: screen2
                anchors.fill: parent
                anchors.top: parent.top
                spacing: 10

                Text {
                    text: "Modifying Section"
                    font.pointSize: 18
                    //color: "Green"
                }

                //TextField to enter the id to delete
                TextField {
                    id: deleteIdField
                    placeholderText: "Enter ID to del"
                    inputMethodHints: Qt.ImhDigitsOnly
                }

                Button {
                    text: "Delete"
                    onClicked:
                    {
                        if (deleteIdField.text !== "") {
                                   dbManager.deletePerson(parseInt(deleteIdField.text))
                                   personModel.updateModel()  // Refresh the ListView after deletion
                                   deleteIdField.text = ""
                               }
                        }
                }

                Text {
                    text: "Person List"
                    font.pointSize: 24
                    //anchors.horizontalCenter: parent.horizontalCenter
                }

                // Heading row for the ListView
                Row {
                    id: headingRow
                    spacing: 8
                    //anchors.horizontalCenter: parent.horizontalCenter
                    height: 20

                    Rectangle {
                        width: 100
                        height: 20
                        border.color: "black"
                        border.width: 1
                        color: "lightgray"
                        Text {
                            text: " Name"
                            font.bold: true
                            anchors.verticalCenter: parent.verticalCenter
                            width: 100
                        }
                    }

                    Rectangle {
                        width: 50
                        height: 20
                        border.color: "black"
                        border.width: 1
                        color: "lightgray"
                        Text {
                            text: " Age"
                            font.bold: true
                            anchors.verticalCenter: parent.verticalCenter
                            width: 50
                        }
                    }

                    Rectangle {
                        width: 70
                        height: 20
                        border.color: "black"
                        border.width: 1
                        color: "lightgray"
                        Text {
                            text: " Gender"
                            font.bold: true
                            anchors.verticalCenter: parent.verticalCenter
                            width: 70
                        }
                    }

                    Rectangle {
                        width: 80
                        height: 20
                        border.color: "black"
                        border.width: 1
                        color: "lightgray"
                        Text {
                            text: " ID"
                            font.bold: true
                            anchors.verticalCenter: parent.verticalCenter
                            width: 80
                        }
                    }
                }

                ListView {
                    id: listView
                    width: parent.width
                    height: 200
                    anchors.top: headingRow.bottom
                    model: personModel

                    delegate: Item {
                        width: 50
                        height: 20

                        Row {
                            spacing: 8

                            Rectangle {
                                width: 100
                                height: 20
                                border.color: "black"
                                Text {
                                    text: model.name
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: 100
                                    anchors.left: parent.left
                                    anchors.leftMargin: 5 //Adjust this value to change the left padding
                                }
                            }
                            Rectangle {
                                width: 50
                                height: 20
                                border.color: "black"
                                Text {
                                    text: model.age
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: 50
                                    anchors.left: parent.left
                                    anchors.leftMargin: 5 //Adjust this value to change the left padding
                                }
                            }
                            Rectangle {
                                width: 70
                                height: 20
                                border.color: "black"
                                Text {
                                    text: model.gender
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: 70
                                    anchors.left: parent.left
                                    anchors.leftMargin: 5 //Adjust this value to change the left padding
                                }
                            }
                            Rectangle {
                                width: 80
                                height: 20
                                border.color: "black"
                                Text {
                                    text: model.personId
                                    anchors.verticalCenter: parent.verticalCenter
                                    width: 80
                                    anchors.left: parent.left
                                    anchors.leftMargin: 5 //Adjust this value to change the left padding
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    // Swipe indicator outside of the SwipeView
        Item {
            id: pageIndicatorContainer
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            height: 50  // Adjust height to ensure visibility

            PageIndicator {
                id: pageIndicator
                count: swipeView.count
                currentIndex: swipeView.currentIndex
                interactive: false // Disable internal interaction
                anchors.verticalCenter: parent.verticalCenter  // Center vertically
                opacity: 1.0  // Ensure visibility
            }

            // Mouse area to handle page switching
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    swipeView.currentIndex = Math.floor(mouse.x / (width / pageIndicator.count)); // Calculate the index based on the mouse position
                }
            }
        }
}
