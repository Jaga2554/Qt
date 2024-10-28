#include <QCoreApplication>
#include <QSharedMemory>
#include <QDebug>
#include <cstring> // Needed for std::strlen
#include <QFile>
#include <QTextStream>

void saveDataToFile(const QString &filename, const char *data) {
    QFile file(filename);
    if(file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        QTextStream out(&file);
        out << data;
        file.close();
        qDebug() << "Data saved to file:" << filename;
    } else {
        qDebug() << "Error: Couldn't open file for writing!" << filename;
    }

}

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    // Step-1: Create a shared memory with a unique key
    QSharedMemory sharedMemory("SharedMemoryExampleKey1");
    qDebug() << "sharedMemory obj created successfully!";

    // Check for an existing shared memory segment and detach if it exists
    if (sharedMemory.isAttached()) {
        qDebug() << "Shared memory exists! Detaching...";
        if (!sharedMemory.detach()) {  // Always check if detach() succeeds
            qDebug() << "Error: Failed to detach existing shared memory.";
            return 1;
        }
        qDebug() << "Detached existing shared memory segment.";
    }
    qDebug() << "Shared Memory doestn't exists.";

    // Step-2: Allocate and attach the shared memory
    if (!sharedMemory.create(1024)) { // 1024 bytes for simplicity
        qDebug() << "Error: Shared memory segment already exists or failed to create!";
        return 1;
    }
    qDebug() << "Shared memory created successfully.";

    // Step-3: Write data to shared memory
    sharedMemory.lock();
    char *to = static_cast<char*>(sharedMemory.data()); // Access shared memory data pointer

    // Ensure sharedMemory.data() is not null
    if (to == nullptr) {
        qDebug() << "Error: Failed to access shared memory data pointer.";
        sharedMemory.unlock();
        return 1;
    }

    const char *message = "Hello from Application 1!";
    std::memcpy(to, message, std::strlen(message) + 1); // Copy message to shared memory
    sharedMemory.unlock();
    qDebug() << "Message written to shared memory:" << message;

    // Step: Save data to a file
    saveDataToFile("shared_memory_data.txt", message);  // Save the message to a file
    return a.exec();
}

