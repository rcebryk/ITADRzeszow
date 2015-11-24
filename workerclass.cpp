#include "workerclass.h"

WorkerClass::WorkerClass(QString name, QObject *parent)
    : QObject(parent)
    , name(name)
{

}

QString WorkerClass::getName()
{
    return name;
}

