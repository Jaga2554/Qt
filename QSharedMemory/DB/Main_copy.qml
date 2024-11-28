import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    height: 480
    width: 680
    title: qsTr("Person Manager")

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
    }

    //
}
