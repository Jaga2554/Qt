import QtQuick 2.15
import QtQuick.Controls 2.15

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
                            anchors.leftMargin: 20 //Adjust this value to change the left padding
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
