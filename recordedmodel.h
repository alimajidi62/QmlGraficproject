/*
 class of RecordedList Model
 */
#ifndef RecordedList_H
#define RecordedList_H
#include <QObject>
#include <QSqlQueryModel>
class RecordedListModel : public QSqlQueryModel
{
    Q_OBJECT
public :
    // model structure
    enum Roles {
        IdRole = Qt::UserRole + 1,      // id
        NumRule ,
        NameRule ,
        Col1Rule ,
        Col2Rule ,
        DateTimeRole ,
        PosRule
    };
    explicit RecordedListModel(QObject *parent = 0);  
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;
protected:
    QHash<int, QByteArray> roleNames() const;
signals:
public slots:
     void updateModel();
    int getId(int row);
    QString getName(int row);
};

#endif // RecordedList_H

