/*
 class of RecordedList Model
 */
#include "recordedmodel.h"
#include "database.h"
#include <QStringBuilder>
// constructor
RecordedListModel::RecordedListModel(QObject *parent) :
    QSqlQueryModel(parent)
{
    this->updateModel();
}
// The method for obtaining data from the model
QVariant RecordedListModel::data(const QModelIndex & index, int role) const {
    // Define the column number, on the role of number
    int columnId = role - Qt::UserRole - 1;
    // Create the index using a column ID
    QModelIndex modelIndex = this->index(index.row(), columnId);
    return QSqlQueryModel::data(modelIndex, Qt::DisplayRole);
}
// return list of recorded list models
QHash<int, QByteArray> RecordedListModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[IdRole] = "id";
    roles[NumRule] = "RecNum";
    roles[NameRule] = "RecName";
    roles[Col1Rule] = "RecCol1";
    roles[Col2Rule] = "RecCol2";
    roles[DateTimeRole] = "RecDateTime";
    roles[PosRule] = "RecPos";
    return roles;
}

// The method updates the tables in the data model representation
void RecordedListModel::updateModel()
{
    // The update is performed SQL-queries to the database
    this->setQuery("SELECT id, RecNum ,  RecName    , '*' as RecCol1 , '@' as RecCol2 , (RecDateTime) as RecDateTime, 'E' || ' ' || RecPosX  || 'N' || ' ' || RecPosY  as RecPos, RecPosX , RecPosY , RecPosZ  FROM  RecordedPoint order by RecName ");
}

// Getting the id of the row in the data view model
int RecordedListModel::getId(int row)
{
    return this->data(this->index(row, 0), IdRole).toInt();
}
// Getting the name of the row in the data view model
QString RecordedListModel::getName(int row)
{
    return this->data(this->index(row, 1), NameRule).toString();
}
