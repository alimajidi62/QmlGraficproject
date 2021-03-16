/*
 the public class of 'Model' layer
 this class contains all of functions to create , resotre , change in database and all of refers from and to database apsses from this class
 */
#ifndef DATABASE_H
#define DATABASE_H
#include <QObject>
#include <QSql>
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlDatabase>
#include <QFile>
#include <QDate>
#include <QDebug>
#include <QDir>
#define DATABASE_HOSTNAME   "sadad"
class DataBase : public QObject
{
    Q_OBJECT
public:
    explicit DataBase(QObject *parent = 0);
    ~DataBase();
    // connect to sqlite database
    void connectToDataBase();
    // the name of database file and path
    QString   DATABASE_NAME;
    QSqlDatabase    db;
private:
    // connet to database and open it
    bool openDataBase();
    // Create dagtabase if it does not exist
    bool restoreDataBase();
    // close connection of database
    void closeDataBase();
    bool createTableRecordedPoint();
public slots:
    // Remove some record of recordedlist Mode by id
    bool recordedListRemoveRecord(const int id); // Removing records from the table on its id
    // Edit a recordedlist mode with RecName parameters
    bool recordedListEditRecord(const int id , const QString RecName);
    // insert recod of recordedlist mode by its pareameters
    bool recordedListInserIntoTable(const int RecNum , const QString RecName ,const QString RecDateTime , const int RecPosX , const int RecPosY , const int RecPosZ);
};
#endif // DATABASE_H
