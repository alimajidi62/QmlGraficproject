/*
 the public class of 'Model' layer
 this class contains all of functions to create , resotre , change in database and all of refers from and to database apsses from this class
 */

#include <QDir>
#include "database.h"
// Constructure
DataBase::DataBase(QObject *parent) : QObject(parent)
{
    DATABASE_NAME = QDir().currentPath() + "/sadadDb.db";
}
// Destrucure
DataBase::~DataBase()
{

}
// Connect to database
void DataBase::connectToDataBase()
{
    if(!QFile( DATABASE_NAME).exists()){
        this->restoreDataBase();
    } else {
        this->openDataBase();
    }
}

// Edit a recordedlist mode with RecName parameters
bool DataBase::recordedListEditRecord(const int id , QString RecName)
{
    QSqlQuery query;
    query.prepare("update  RecordedPoint set RecName = :RecName WHERE id= :ID ;");
    query.bindValue(":ID", id);
    query.bindValue(":RecName", RecName);
    if(!query.exec()){
        qDebug() << "error delete row RecordePoint" ;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}
// Remove some record of recordedlist Mode by id
bool DataBase::recordedListRemoveRecord(const int id)
{
    QSqlQuery query;
    query.prepare("DELETE FROM RecordedPoint WHERE id= :ID ;");
    query.bindValue(":ID", id);
    if(!query.exec()){
        qDebug() << "error delete row RecordePoint" ;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}
// insert recod of recordedlist mode by its pareameters
bool DataBase::recordedListInserIntoTable(const int RecNum , const QString RecName ,const QString RecDateTime , const int RecPosX , const int RecPosY , const int RecPosZ )
{
    QSqlQuery query;
    query.prepare("INSERT INTO RecordedPoint ( RecNum ,  RecName , RecDateTime ,  RecPosX , RecPosY ,  RecPosZ  ) "
                  "VALUES ( :RecNum , :RecName, dateTime('now'), :RecPosX , :RecPosY , :RecPosZ)");
    query.bindValue(":RecNum",         RecNum );
    query.bindValue(":RecName",       RecName);
    query.bindValue(":RecPosX",         RecPosX);
    query.bindValue(":RecPosY",         RecPosY);
    query.bindValue(":RecPosZ",         RecPosZ);
    if(!query.exec()){
        qDebug() << "error insert into RecordedPoint" ;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}
// Create dagtabase if it does not exist
bool DataBase::restoreDataBase()
{
    if(this->openDataBase()){
        return (this->createTableRecordedPoint()) ? true : false;
    } else {
        qDebug() << "Failed to restore the database";
        return false;
    }
    return false;
}
// connet to database and open it
bool DataBase::openDataBase()
{
    db = QSqlDatabase::addDatabase("QSQLITE");
    db.setHostName(DATABASE_HOSTNAME);
    db.setDatabaseName(DATABASE_NAME);
    if(db.open()){
        return true;
    } else {
        return false;
    }
}
// close connection of database
void DataBase::closeDataBase()
{
    db.close();
}
// create tabel of RecordedList
bool DataBase::createTableRecordedPoint()
{
    QSqlQuery query;
    if(!query.exec( "CREATE TABLE RecordedPoint ("
                    "id INTEGER PRIMARY KEY AUTOINCREMENT, "
                    "RecNum  integer    NOT NULL ,"
                    "RecName     VARCHAR(255)    NOT NULL,"
                    "RecDateTime  dateTime    NOT NULL,"
                    "RecPosX  integer    NOT NULL,"
                    "RecPosY  integer    NOT NULL,"
                    "RecPosZ  integer    NOT NULL"
                    " )"
                    )){
        qDebug() << "DataBase: error of create RecordePoint" ;
        qDebug() << query.lastError().text();
        return false;
    } else {
        return true;
    }
    return false;
}

