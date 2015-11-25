#ifndef WORKERCLASS_H
#define WORKERCLASS_H

#include <QObject>
#include "mythread.h"

class WorkerClass : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ getName NOTIFY nameChanged)

public:
    explicit WorkerClass(QString name, QObject *parent = 0);
    ~WorkerClass();
    QString getName();

    Q_INVOKABLE void start();

signals:
    void nameChanged();
    void startSignal();
private slots:
    void threadTimeout(int newTimeout);
private:
    QString name;
    MyThread myThread;
    int lastTimeout;
};

#endif // WORKERCLASS_H
