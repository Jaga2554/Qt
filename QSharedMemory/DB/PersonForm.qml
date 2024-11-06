import QtQuick 2.15
import QtQuick.Controls 2.15

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
        anchors.top: parent.top // Center the image
        anchors.topMargin: 200
        anchors.left: parent.left
        anchors.leftMargin: 300

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
