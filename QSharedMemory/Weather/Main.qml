import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import com.weatherapp 1.0

ApplicationWindow {
    visible: true
    width: 400
    height: 600
    color: "beige"
    title: "Weather"

    ColumnLayout {
        anchors.fill: parent
        spacing: 20

        Rectangle{
            width: 400
            height: 80
            color: "light pink"
            radius: 10
            border.color: "dark blue"
            border.width: 2

            Text {
                id: weclText
                text: "Welcome to the Weather App :-)"
                font.pointSize: 20
                anchors.centerIn: parent


            }
        }


        Rectangle{
            width: 350
            height: 80
            color: "light green"
            radius: 10
            border.color: "dark blue"
            border.width: 2

            Text {
                text: "Select the city of your choice: "
                font.pointSize: 18
                anchors.centerIn: parent

            }
        }

        //List view for selecting city
        ListView {
            id: cityListView
            Layout.fillWidth: true
            Layout.preferredHeight: 100
            model: ["Bengaluru", "Mumbai", "Chennai", "Kolkata", "Delhi", "Tumkur"]

            delegate: Item {
                width: cityListView.width
                height: 50

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "light blue"
                    border.color: "black"
                    radius: 5
                }

                Text {
                    text: modelData
                    anchors.centerIn: parent
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        weatherController.fetchWeather(modelData)
                    }
                }
            }
        }

            //Weather Display
            Rectangle {
                width: 300
                height: 50
                color: "brown"
                radius: 10
                border.color: "dark blue"
                border.width: 2
                anchors.top: ListView.bottom
                anchors.bottom: myRect.top
                Text {
                    id: cityLabel
                    text: "City: "
                    font.pixelSize: 24
                    padding: 10
                }
            }

            Rectangle {
                id: myRect
                width: 250
                height: 50
                color: "orange"
                radius: 10
                border.color: "dark blue"
                border.width: 2
                Text {
                    id: temperatureLabel
                    text: "Temperature: "
                    font.pixelSize: 24
                    padding: 10
                }

            }

            Rectangle {
                width: 350
                height: 50
                color: "orange"
                radius: 10
                border.color: "dark blue"
                border.width: 2
                anchors.top: myRect.bottom
                Text {
                    id: descriptional
                    text: "Description: "
                    font.pixelSize: 24
                    padding: 10
                }
            }


    }

    //Weather Controller Exposed to QML
    WeatherController {
        id: weatherController
        onWeatherDataChanged: {
            cityLabel.text = "City: " + weatherController.city
            temperatureLabel.text = "Temperature: " + weatherController.temperature + " °C"
            descriptional.text = "Description: " + weatherController.description
        }
    }
}
