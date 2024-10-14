#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int speed READ speed WRITE setSpeed NOTIFY speedChanged)
    Q_PROPERTY(int batteryLevel READ batteryLevel WRITE setBatteryLevel NOTIFY batteryLevelChanged)

public:
    explicit Backend(QObject *parent = nullptr);

    int speed() const;
    void setSpeed(int newSpeed);

    int batteryLevel() const;
    void setBatteryLevel(int newBatteryLevel);


signals:
    void speedChanged();
    void batteryLevelChanged();
    void modeChanged();

private:
    int m_speed;
    int m_batteryLevel;
};

#endif // BACKEND_H
