#include "Backend.h"

Backend::Backend(QObject *parent) : QObject(parent), m_speed(0), m_batteryLevel(100) {}

int Backend::speed() const { return m_speed; }
void Backend::setSpeed(int newSpeed) {
    if (m_speed != newSpeed) {
        m_speed = newSpeed;
        emit speedChanged();
    }
}

int Backend::batteryLevel() const { return m_batteryLevel; }
void Backend::setBatteryLevel(int newBatteryLevel) {
    if (m_batteryLevel != newBatteryLevel) {
        m_batteryLevel = newBatteryLevel;
        emit batteryLevelChanged();
    }
}
