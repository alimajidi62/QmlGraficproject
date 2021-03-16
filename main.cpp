/*
 main class of c++ codes and related between c++ side and qml side of project
 */
#include <QGuiApplication>
#include "qqmlapplicationengine.h"

//#include "QQmlApplicationEngine"
#include <QQmlContext>
#include "database.h"
#include "recordedmodel.h"
int main(int argc, char *argv[])
{
   // QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    DataBase database;
    database.connectToDataBase();
    RecordedListModel *model = new RecordedListModel();
    engine.rootContext()->setContextProperty("myModel", model);
//    engine.rootContext()->setContextProperty("database", &database);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
    return app.exec();
}
