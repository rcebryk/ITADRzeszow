#include "mythread.h"

void MyThread::run()
{
    this->processTasks();
}

void MyThread::processTasks()
{
    for(int i=0; i<duration;i++) {
        emit updatingTimeout(i);
        sleep(1);
    }
}

void MyThread::setDuration(int duration)
{
    this->duration = duration;
}
