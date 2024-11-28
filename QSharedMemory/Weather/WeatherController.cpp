#include "WeatherController.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

WeatherController::WeatherController(QObject *parent): QObject(parent), networkManager(new QNetworkAccessManager(this)) {
    connect(networkManager, &QNetworkAccessManager::finished, this, &WeatherController::onWeatherReply);
}

QString WeatherController::city() const{
    return m_city;
}

QString WeatherController::temperature() const{
    return m_temperature;
}

QString WeatherController::description() const{
    return m_description;
}

void WeatherController::fetchWeather(const QString &cityName) {
    const QString apiKey = "cbd3a3739560a15feaf5f1ca3bfdff39";
    const QString url = QString("https://api.openweathermap.org/data/2.5/weather?q=%1&units=metric&appid=%2")
                            .arg(cityName)
                            .arg(apiKey);

    QNetworkRequest request;
    request.setUrl(QUrl(url));
    networkManager->get(request);
}
void WeatherController::setCity(const QString &city) {
    if (m_city != city) {
        m_city = city;
        emit weatherDataChanged();
    }
}

void WeatherController::onWeatherReply(QNetworkReply *reply) {
    if (reply->error() != QNetworkReply::NoError) {
        return;
    }

    QByteArray responseData = reply->readAll();
    QJsonDocument jsonDoc = QJsonDocument::fromJson(responseData);
    QJsonObject jsonObj = jsonDoc.object();

    m_city = jsonObj["name"].toString();
    m_temperature = QString::number(jsonObj["main"].toObject()["temp"].toDouble());
    m_description = jsonObj["weather"].toArray()[0].toObject()["description"].toString();

    emit weatherDataChanged();
    reply->deleteLater();
}
