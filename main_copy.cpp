#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "database.h"
#include "listmodel.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);




    QQmlApplicationEngine engine;

    DataBase database;
    database.connectToDataBase();

    ListModel *model = new ListModel();

    engine.rootContext()->setContextProperty("myModel", model);
    engine.rootContext()->setContextProperty("database", &database);

    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
