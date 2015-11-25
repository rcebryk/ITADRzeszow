#include "mythread.h"
#include <QDebug>

void MyThread::run()
{
    qDebug() << "RUN STARTED";
    for(int i=0; i<duration;i++) {
        emit updatingTimeout(i);
        sleep(1);
    }
}

void MyThread::setDuration(int duration)
{
    this->duration = duration;
}
