#include "ModeManager.h"
#include <QKeyEvent>

ModeManager::ModeManager(QObject *parent)
    : QObject(parent), m_mode("ECO MODE"),
    m_progressValue(30),
    m_rightArrow(true),
    m_leftArrow(false),
    m_speed(36),
    m_arc(true),
    m_battHealth(100)  // Default mode
{
}

QString ModeManager::mode() const {
    return m_mode;
}

int ModeManager::progressValue() const {
    return m_progressValue;
}

bool ModeManager::rightArrow() const {
    return m_rightArrow;
}

bool ModeManager::leftArrow() const {
    return m_leftArrow;
}
int ModeManager::speed() const {
    return m_speed;
}
int ModeManager::battHealth() const {
    return m_battHealth;
}
bool ModeManager::arc() const {
    return m_arc;
}

void ModeManager::setMode(const QString &newMode) {
    if (m_mode != newMode) {
        m_mode = newMode;
        emit modeChanged();  // Notify QML of the change
    }
}
void ModeManager::setProgressValue(int value) {
    if (value != m_progressValue) {
        m_progressValue = value;
        emit progressValueChanged();  // Notify QML that the value has changed
    }
}
void ModeManager::setRightArrow(bool &visible) {
     if (visible != m_rightArrow) {
         m_rightArrow = visible;
         emit rightArrowUpdated();
     }
}
void ModeManager::setLeftArrow(bool &lvisible) {
    if (lvisible != m_leftArrow) {
        m_leftArrow = lvisible;
        emit leftArrowUpdated();
    }
}
void ModeManager::setSpeed(int newSpeed) {
    if(newSpeed != m_speed) {
        m_speed = newSpeed;
        emit speedChanged(newSpeed);
    }
}
void ModeManager::setBattHealth(int bvalue) {
    if (bvalue != m_battHealth) {
        m_battHealth = bvalue;
        emit battHealthChanged();  // Notify QML that the value has changed
    }
}
void ModeManager::setArc(bool &avisible) {
    if(avisible != m_arc) {
        m_arc = avisible;
        emit arcChanged();
    }
}
// Function to handle keyboard input and change the mode
void ModeManager::handleKeyPress(int keyCode) {
    bool isVisible= true;
    bool isNotVisible = false;
    switch (keyCode) {
    case Qt::Key_1:
        setMode("ECO MODE");
        setProgressValue(30);
        setRightArrow(isVisible);
        setLeftArrow(isNotVisible);
        setSpeed(36);
        setArc(isVisible);
        setBattHealth(100);
        break;
    case Qt::Key_2:
        setMode("Battery temperaturer high. Contact Service Center");
        setProgressValue(125);  // Set progress to 100% when key '2' is pressed
        setRightArrow(isNotVisible);
        setLeftArrow(isVisible);
        setSpeed(0);
        setArc(isVisible);
        setBattHealth(78);
        break;
    case Qt::Key_3:
        setMode("REVERSE");
        setProgressValue(30);
        setRightArrow(isNotVisible);
        setLeftArrow(isNotVisible);
        setSpeed(0);
        setArc(isNotVisible);
        setBattHealth(78);
        break;
    case Qt::Key_4:
        setMode("HANDBRAKE");
        setProgressValue(30);
        setRightArrow(isNotVisible);
        setLeftArrow(isNotVisible);
        setSpeed(36);
        setArc(isVisible);
        setBattHealth(100);
        break;
    case Qt::Key_5:
        setMode("BRAKE FLUIDFLOW");
        setProgressValue(30);
        setRightArrow(isNotVisible);
        setLeftArrow(isNotVisible);
        setSpeed(36);
        setArc(isVisible);
        setBattHealth(5);
        break;
    default:
        setMode("ECO MODE");
        setProgressValue(30);
        setRightArrow(isVisible);
        setLeftArrow(isNotVisible);
        setArc(isVisible);
        setSpeed(36);
        break;
    }
}
