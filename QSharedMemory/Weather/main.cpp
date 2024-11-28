#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "WeatherController.h"
/*
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Weather", "Main");

    return app.exec();
}
*/

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Register the WeatherController class in QML
    qmlRegisterType<WeatherController>("com.weatherapp", 1, 0, "WeatherController");

    engine.load(QUrl(QStringLiteral("qrc:/qt/qml/Weather/Main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
