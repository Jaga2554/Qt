#include <QCoreApplication>
#include <QSharedMemory>
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    //Step-1: Attach the existing shared memory
    QSharedMemory sharedMemory("SharedMemoryExampleKey1");

    if(!sharedMemory.attach()) {
        qDebug() << "Failed to attach shared memory";
        return 1;
    }

    qDebug() << "Shared Memory attached successfully!";

    //Step-2: Read data from shared memory
    sharedMemory.lock();
    char *from = static_cast<char*>(sharedMemory.data());
    qDebug() << "Message read from shared memory: " << from;
    sharedMemory.unlock();

    return a.exec();
}
