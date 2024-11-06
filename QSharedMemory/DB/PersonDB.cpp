// dbmanager.cpp
#include "PersonDB.h"

DbManager::DbManager(QObject* parent) : QObject(parent)
{
    setupDatabase();
}

bool DbManager::setupDatabase()
{
    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName("person_db.sqlite");

    if (!m_db.open()) {
        qDebug() << "Error: Connection with database failed.";
        return false;
    } else {
        QSqlQuery query;
        query.exec("CREATE TABLE IF NOT EXISTS persons ("
                   "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                   "name TEXT, "
                   "age INTEGER, "
                   "gender TEXT, "
                   "person_id INTEGER)");
        return true;
    }
}

bool DbManager::addPerson(const QString& name, int age, const QString& gender, int id)
{
    QSqlQuery query;
    query.prepare("INSERT INTO persons (name, age, gender, person_id) "
                  "VALUES (:name, :age, :gender, :person_id)");
    query.bindValue(":name", name);
    query.bindValue(":age", age);
    query.bindValue(":gender", gender);
    query.bindValue(":person_id", id);

    if (!query.exec()) {
        qDebug() << "Add person failed: " << query.lastError();
        return false;
    }
    return true;
}

bool DbManager::deletePerson(int id) {
    QSqlQuery query(m_db);
    //Check if the database is open before opening the query
    if(!m_db.open()) {
        qDebug() << "Database is not open.";
        return false;
    } else {
        qDebug() << "Database is open.";
    }


    query.prepare("DELETE FROM persons WHERE person_id = :p_id");
    query.bindValue(":p_id", id);

    // Debugging: Print the ID being deleted
    qDebug() << "Attempting to delete person with ID:" << id;

    qDebug() << "Last query executed:" << query.lastQuery();
    qDebug() << "Bound value for :person_id:" << id;

    if(!query.exec()) {
        qDebug() << "Deletion failed." << query.lastError().text();
        return false;
    }

    if (query.numRowsAffected() == 0) {
        qDebug() << "No rows were deleted. ID might not exist.";
        return false;
    }

    qDebug() << "Deleted row with ID: " << id;
    return true;
}
