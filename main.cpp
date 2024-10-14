
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtQuickControls2/QQuickStyle>

#include "ModeManager.h"
#include "Backend.h"  // Your backend logic

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Set the application style to "Material"
    //QQuickStyle::setStyle("Material");  // You can also use "Fusion" or "Basic"

    QQmlApplicationEngine engine;

    // Create an instance of your backend class
    Backend backend;
    ModeManager modeManager; // Instantiate the mode

    engine.rootContext()->setContextProperty("modeManager", &modeManager);
    engine.rootContext()->setContextProperty("backend", &backend);


    const QUrl url(QStringLiteral("qrc:/qt/qml/FirstProject/Main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);
    //engine.load(QUrl(QStringLiteral("qrc:/qt/qml/FirstProject/Main.qml")));
    engine.load(url);

    return app.exec();
}
