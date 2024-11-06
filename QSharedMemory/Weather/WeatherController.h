#ifndef WEATHERCONTROLLER_H
#define WEATHERCONTROLLER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>

class WeatherController : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString city READ city WRITE setCity NOTIFY weatherDataChanged)
    Q_PROPERTY(QString temperature READ temperature NOTIFY weatherDataChanged)
    Q_PROPERTY(QString description READ description NOTIFY weatherDataChanged)

public:
    explicit WeatherController(QObject *parent = nullptr);

    QString city() const;
    QString temperature() const;
    QString description() const;

    Q_INVOKABLE void fetchWeather(const QString &cityName);

signals:
    void weatherDataChanged();

private slots:
    void onWeatherReply(QNetworkReply *reply);

private:
    Q_INVOKABLE void setCity(const QString &city);

    QString m_city;
    QString m_temperature;
    QString m_description;

    QNetworkAccessManager *networkManager;

};

#endif //WEATHERCONTROLLER_H
