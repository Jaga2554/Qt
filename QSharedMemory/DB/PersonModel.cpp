#include "PersonModel.h"

PersonModel::PersonModel(QObject *parent)
    : QSqlQueryModel(parent)
{
    updateModel();
}

QVariant PersonModel::data(const QModelIndex &index, int role) const
{
    // Fetch data from the database based on the role
    if (role == NameRole)
        return QSqlQueryModel::data(this->index(index.row(), 1)); // Name is in the second column
    else if (role == AgeRole)
        return QSqlQueryModel::data(this->index(index.row(), 2)); // Age is in the third column
    else if (role == GenderRole)
        return QSqlQueryModel::data(this->index(index.row(), 3)); // Gender is in the fourth column
    else if (role == IdRole)
        return QSqlQueryModel::data(this->index(index.row(), 4)); // ID is in the fifth column

    return QVariant();
}

QHash<int, QByteArray> PersonModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[AgeRole] = "age";
    roles[GenderRole] = "gender";
    roles[IdRole] = "personId";
    return roles;
}

void PersonModel::updateModel()
{
    // Set the query to fetch the data from the persons table
    this->setQuery("SELECT id, name, age, gender, person_id FROM persons");
}
