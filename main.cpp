#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "todomodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    TodoModel todoModel;

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("TodoModel", &todoModel);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("ToDoList", "Main");

    return app.exec();
}
