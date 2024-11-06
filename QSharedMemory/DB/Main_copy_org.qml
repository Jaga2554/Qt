import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 500
    title: "Person Database"

    Column {
        spacing: 10
        //anchors.top: parent

        TextField {
            id: nameField
            placeholderText: "Enter Name"
           // width: parent.width * 0.8
        }

        TextField {
            id: ageField
            placeholderText: "Enter Age"
           // width: parent.width * 0.8
            inputMethodHints: Qt.ImhDigitsOnly
        }

        ComboBox {
            id: genderField
           // width: parent.width * 0.8
            model: ["Male", "Female", "Other"]
            currentIndex: 0
        }

        TextField {
            id: idField
            placeholderText: "Enter ID"
           // width: parent.width * 0.8
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

        // Heading row for the ListView
                Row {
                    spacing: 8
                    //width: parent.width * 0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                    height: 20
                    Rectangle {
                                    width: 100
                                    height: 20
                                    border.color: "black"
                                    border.width: 1
                                    color: "lightgray"
                    Text {
                        text: "Name"
                        font.bold: true
                        width: 100  // Same width as the Text in ListView delegate
                    }
                    }
                    Rectangle {
                                    width: 50
                                    height: 20
                                    border.color: "black"
                                    border.width: 1
                                    color: "lightgray"
                    Text {
                        text: "Age"
                        font.bold: true
                        width: 50  // Same width as the Text in ListView delegate
                    }
                    }
                    Rectangle {
                                    width: 70
                                    height: 20
                                    border.color: "black"
                                    border.width: 1
                                    color: "lightgray"
                    Text {
                        text: "Gender"
                        font.bold: true
                        width: 70  // Same width as the Text in ListView delegate
                    }
                    }
                    Rectangle {
                                    width: 80
                                    height: 20
                                    border.color: "black"
                                    border.width: 1
                                    color: "lightgray"
                    Text {
                        text: "ID"
                        font.bold: true
                        width: 80  // Same width as the Text in ListView delegate
                    }
                    }
                }

        ListView {
            id: listView
            width: parent.width
            height: 200
            anchors.horizontalCenter: parent.horizontalCenter
            model: personModel

            delegate: Item {
                width: 50
                height: 20

                Row {
                     spacing: 8
                    //padding: 4
                    Rectangle {
                        width: 100; height:20; border.color: "black"
                    Text {
                            text:model.name
                            width: 100
                        }
                    }
                    Rectangle {
                        width: 50; height:20; border.color:"black"
                    Text {
                        text:model.age
                        width: 50
                        }
                    }
                    Rectangle {
                        width: 70; height:20; border.color:"black"
                    Text {
                        text:model.gender
                        width: 70
                    }
                    }
                    Rectangle {
                        width: 80; height:20; border.color:"black"
                    Text {
                        text:model.personId
                        width: 80
                    }
                    }
                }
            }
        }
    }
}
