#ifndef PROGRESSMANAGER_H
#define PROGRESSMANAGER_H

#include <QObject>

class ProgressManager : public QObject {
    Q_OBJECT
    Q_PROPERTY(int progressValue READ progressValue WRITE setProgressValue NOTIFY progressValueChanged)

public:
    explicit ProgressManager(QObject *parent = nullptr);

    int progressValue() const;
    void setProgressValue(int value);

public slots:
    void handleKeyPress(int keyCode);

signals:
    void progressValueChanged();

private:
    int m_progressValue;  // Stores the current progress value
};

#endif // PROGRESSMANAGER_H
