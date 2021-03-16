 bool removeRecord(const int id); // Removing records from the table on its id
 
 
 bool RecordedListModel::removeRecord(const int id)
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
