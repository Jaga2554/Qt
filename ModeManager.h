#ifndef MODEMANAGER_H
#define MODEMANAGER_H

#include <QObject>

class ModeManager : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString mode READ mode WRITE setMode NOTIFY modeChanged)
    Q_PROPERTY(int progressValue READ progressValue WRITE setProgressValue NOTIFY progressValueChanged)
    Q_PROPERTY(bool rightArrow READ rightArrow WRITE setRightArrow NOTIFY rightArrowUpdated)
    Q_PROPERTY(bool leftArrow READ leftArrow WRITE setLeftArrow NOTIFY leftArrowUpdated)
    Q_PROPERTY(int battHealth READ battHealth WRITE setBattHealth NOTIFY battHealthChanged)
    Q_PROPERTY(int speed READ speed WRITE setSpeed NOTIFY speedChanged)
    Q_PROPERTY(bool arc READ arc WRITE setArc NOTIFY arcChanged)

public:
    explicit ModeManager(QObject *parent = nullptr);

    // Getter for the mode property
    QString mode() const;
    int progressValue() const;
    bool rightArrow() const;
    bool leftArrow() const;
    int battHealth() const;
    int speed() const;
    bool arc() const;



    // Setter for the mode property
    void setMode(const QString &newMode);
    void setProgressValue(int value);
    void setRightArrow(bool &visible);
    void setLeftArrow(bool &lvisible);
    void setBattHealth(int bvalue);
    void setSpeed(int newSpeed);
    void setArc(bool &avisible);

    // Function to handle keyboard input and change modes
    Q_INVOKABLE void handleKeyPress(int keyCode);

signals:
    void modeChanged();  // Signal to notify when the mode changes
    void progressValueChanged(); //Signal to notify when progressValueChanged
    void rightArrowUpdated();
    void leftArrowUpdated();
    void battHealthChanged();
    void speedChanged(int newSpeed);
    void arcChanged();

private:
    QString m_mode;  // Holds the current mode
    int m_progressValue;  // Stores the current progress value
    bool m_rightArrow; //Stores rihgt arrow to be present
    bool m_leftArrow;
    int m_battHealth;
    int m_speed;
    bool m_arc;

};

#endif // MODEMANAGER_H
