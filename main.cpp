#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDateTime>
#include "workerclass.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("currentDateTime", QDateTime::currentDateTime());
    WorkerClass worker("ThreadWorker");
    engine.rootContext()->setContextProperty("worker", &worker);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

