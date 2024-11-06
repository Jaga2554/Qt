#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "PersonDB.h"
#include "PersonModel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Expose the DbManager and PersonModel to QML
    DbManager dbManager;
    PersonModel personModel;

    engine.rootContext()->setContextProperty("dbManager", &dbManager);
    engine.rootContext()->setContextProperty("personModel", &personModel);

    engine.load(QUrl::fromLocalFile("C:/Users/Admin/Documents/DB/Main.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
