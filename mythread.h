#ifndef MYTHREAD_H
#define MYTHREAD_H

#include <QThread>

class MyThread : public QThread
{
    Q_OBJECT

    void run();

public:
    void setDuration(int duration);

signals:
    void updatingTimeout(int passedSeconds);
private:
    int duration;
};

#endif // MYTHREAD_H
