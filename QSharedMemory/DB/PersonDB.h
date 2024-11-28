// dbmanager.h
#ifndef DBMANAGER_H
#define DBMANAGER_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QSqlError>
#include <QDebug>

class DbManager : public QObject
{
    Q_OBJECT
public:
    explicit DbManager(QObject* parent = nullptr);
    Q_INVOKABLE bool addPerson(const QString& name, int age, const QString& gender, int id);
    bool setupDatabase();
    Q_INVOKABLE bool deletePerson(int id);
private:
    QSqlDatabase m_db;
};

#endif // DBMANAGER_H
