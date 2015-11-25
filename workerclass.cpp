#include "workerclass.h"

WorkerClass::WorkerClass(QString name, QObject *parent)
    : QObject(parent)
    , name(name)
    , lastTimeout(-1)
{
    myThread.setDuration(5);
    connect(&myThread,SIGNAL(updatingTimeout(int)),SLOT(threadTimeout(int)));
}

WorkerClass::~WorkerClass()
{
    if(myThread.isRunning())
        myThread.terminate();
    myThread.wait();
}

QString WorkerClass::getName()
{
    if (lastTimeout == -1)
        return name;
    else
        return name+QString(" ")+QString::number(lastTimeout);
}

void WorkerClass::start()
{
    if( myThread.isRunning()) {
        myThread.terminate();
        myThread.wait();
    }
    else
        myThread.start();
}

void WorkerClass::threadTimeout(int newTimeout)
{
    lastTimeout = newTimeout;
    emit this->nameChanged();
}

