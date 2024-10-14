#include "ProgressManager.h"
#include <QKeyEvent>

ProgressManager::ProgressManager(QObject *parent) : QObject(parent), m_progressValue(0) {
}

int ProgressManager::progressValue() const {
    return m_progressValue;
}

void ProgressManager::setProgressValue(int value) {
    if (value != m_progressValue) {
        m_progressValue = value;
        emit progressValueChanged();  // Notify QML that the value has changed
    }
}

void ProgressManager::handleKeyPress(int keyCode) {
    switch (keyCode) {

    case Qt::Key_2:
        setProgressValue(100);  // Set progress to 100% when key '2' is pressed
        break;
    // Add more key mappings as needed...
    default:
        setProgressValue(40);
        break;
    }
}
