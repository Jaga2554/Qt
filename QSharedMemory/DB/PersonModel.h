#ifndef PERSONMODEL_H
#define PERSONMODEL_H

#include <QSqlQueryModel>
#include <QSqlQuery>
#include <QSqlRecord>

class PersonModel : public QSqlQueryModel
{
    Q_OBJECT
public:
    explicit PersonModel(QObject *parent = nullptr);

    // Override the data method to expose the model to QML
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    // Return the roles in the model
    QHash<int, QByteArray> roleNames() const override;

    // Method to reload data from the database
    Q_INVOKABLE void updateModel();

private:
    enum PersonRoles {
        NameRole = Qt::UserRole + 1,
        AgeRole,
        GenderRole,
        IdRole
    };
};

#endif // PERSONMODEL_H
