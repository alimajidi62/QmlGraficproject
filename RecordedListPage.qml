/*
RecordedList page
  */
import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.0
import "Control"
import QtMultimedia 5.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.2
import "commonFunction.js" as CommonFunction
import QtQuick.Dialogs 1.2
Rectangle
{
    id:recordedListMainRectangle
    color: "#D1DEE4"
    //    anchors.fill: parent
    Rectangle {
        color: "#D1DEE4"
        id: leftPanel
        width :  parent.width /10
        anchors{ top :parent.top; left : parent.left;bottom:  parent.bottom;}
        GridLayout {
            anchors.centerIn: parent
            width: parent.width * 95 / 100
            height: parent.height
            id:leftGrid
            columns:  1;
            rows: 7;
            Rectangle {
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                CommonButton
                {
                    anchors.fill: parent
                    text: qsTr( "TBank")

                }
            }
            Rectangle {
                color: "Transparent"
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                CommonButton
                {
                    anchors.fill: parent
                    text: qsTr( "Edit")
                    onClicked:
                    {
                        if(tableView.focus)
                        {
                            loader.visible = true
                            loader.item.forceActiveFocus()
                        }
                    }

                }

            }
            Rectangle {
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                CommonButton
                {
                    anchors.fill: parent
                    text: ""
                    onClicked:
                    {
                        dialogDelete.open()
                    }
                    Text
                    {
                        id:btnDeleteText
                        anchors.centerIn: parent
                        text: "\uf014"
                        font.family: fontawesome.name
                        font.pixelSize: CommonFunction.getIconFontByParentSize(parent.width)

                    }
                    Text
                    {
                        anchors.top:btnDeleteText.bottom
                        text: qsTr( "delete")
                        font.pixelSize: CommonFunction.getTextFontByParentSize(parent.width)
                        width: parent.width
                        horizontalAlignment:  Text.AlignHCenter
                        color: "blue"
                    }
                }
            }
            Rectangle {
                color: "Transparent"
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
            Rectangle {
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                OPRButton
                {
                    anchors.fill: parent
                }
            }
            Rectangle {
                color: "Transparent"
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
            Rectangle {
                color: "Transparent"
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                MapButton
                {
                    anchors.fill: parent
                }
            }

        }

    }

    Rectangle {// Grid Rectangle
        id: mainPanel
        anchors{ top :parent.top; right : rightPanel.left;left: leftPanel.right;bottom:  parent.bottom}
        Layout.columnSpan: 1
        color: "transparent"
        Layout.rowSpan: 1
        Layout.preferredWidth:  parent.width * 8 /10
        Layout.fillHeight: true
        Rectangle{
            id:tableViewRectanle
            anchors{top: parent.top;left: parent.left;right: parent.right}
            height: parent.height * 80 / 100
            TableView {
                id: tableView
                objectName: "tableView"
                headerVisible: false
                Loader {
                    id: loader
                    anchors {centerIn: parent}
                    height: parent.height / 4
                    width: parent.width /4
                    visible: false
                    sourceComponent: visible ? input : undefined
                    Component {
                        id: input
                        Rectangle
                        {
                            color: "blue"
                            Label
                            {
                                id : lblTop
                                anchors{top: parent.top;}
                                height: parent.height / 7
                                font.pixelSize:  CommonFunction.getTextFontByParentSize(parent.width) / 3

                                text: qsTr( "Recorded Name:")
                            }
                            TextField {
                                height:( parent.height - lblTop.height ) * 70 / 100
                                id:txtEdit;
                                anchors {  top: lblTop.bottom;left: parent.left;right: parent.right}
                                text: myModel.getName(tableView.currentRow)
                                font.pixelSize:  CommonFunction.getTextFontByParentSize(parent.width)
                                onAccepted:{
                                    //loader.visible = false
                                }
                            }
                            Row
                            {
                                anchors {  top: txtEdit.bottom;left: parent.left;right: parent.right ; bottom : parent.bottom}
                                Button
                                {
                                    text: qsTr( "OK")
                                    onClicked:
                                    {
                                        if(  database.recordedListEditRecord(  myModel.getId(tableView.currentRow) , txtEdit.text))
                                        {
                                            loader.visible = false;
                                            myModel.updateModel()
                                        }
                                    }
                                }
                                Button
                                {
                                    text:qsTr( "Cancel")
                                    onClicked:
                                    {
                                        loader.visible = false
                                    }
                                }
                            }
                            onActiveFocusChanged: {
                                if (!activeFocus) {
                                    // loader.visible = false
                                }
                            }
                        }
                    }
                }
                style: TableViewStyle {
                    headerDelegate: Rectangle {
                        height: textItem.implicitHeight * 1.2
                        width: textItem.implicitWidth
                        color: "TransParent"
                        Text {
                            id: textItem
                            anchors{fill: parent;leftMargin: 12}
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: styleData.textAlignment
                            text: styleData.value
                            elide: Text.ElideRight
                            color: textColor
                            renderType: Text.NativeRendering
                        }
                        Rectangle {
                            anchors{right: parent.right;top: parent.top;bottom: parent.bottom;bottomMargin: 1;topMargin: 1}
                            width: 1
                            color: "#ccc"
                        }
                    }
                }

                horizontalScrollBarPolicy: -1
                selectionMode: SelectionMode.SingleSelection
                anchors.fill: parent
                rowDelegate: Rectangle {
                    height: tableView.height  / 5 -1
                    SystemPalette {
                        id: myPalette;
                        colorGroup: SystemPalette.Active
                    }
                    color: {
                        var baseColor = styleData.alternate?myPalette.alternateBase:myPalette.base
                        return styleData.selected?myPalette.highlight:baseColor
                    }
                }
                TableViewColumn {
                    id: idCol
                    role: "id"
                    visible: false
                    movable: false
                    resizable: false
                    //  width: tableView.viewport.width - authorColumn.width
                }
                TableViewColumn {
                    id: recNumCol
                    title: "RecNum"
                    role: "RecNum"
                    movable: false
                    resizable: false
                    width: tableView.viewport.width / 12
                    delegate: Rectangle {
                        color: "Transparent"
                        Text {
                            id: recNumColText
                            anchors.centerIn: parent
                            text: styleData.value
                            font.pixelSize: CommonFunction.getTextFontByParentSize(tableView.viewport.width / 12) * 2
                            //font.pixelSize: CommonFunction.getIconFontByParentSize(parent) *10
                        }
                    }
                }
                TableViewColumn {
                    id: recNameCol
                    title: "RecName"
                    role: "RecName"
                    movable: false
                    resizable: false
                    width: tableView.viewport.width / 4
                    delegate: Rectangle {
                        color: "Transparent"
                        Text {
                            anchors.centerIn: parent
                            text: styleData.value
                            font.pixelSize: CommonFunction.getTextFontByParentSize(tableView.viewport.width / 12) * 2
                            //font.pixelSize: CommonFunction.getIconFontByParentSize(parent) *10
                        }
                    }
                }
                TableViewColumn {
                    id: recCol1
                    title: "recCol1"
                    role: "recCol1"
                    movable: false
                    resizable: false
                    width: tableView.viewport.width / 12
                    delegate: Rectangle {
                        color: "Transparent"
                        Text {
                            anchors.centerIn: parent
                            text: "\uf00a"
                            font.family:fontawesome.name
                            font.pixelSize: CommonFunction.getTextFontByParentSize(tableView.viewport.width / 12) * 2
                            //font.pixelSize: CommonFunction.getIconFontByParentSize(parent) *10
                        }
                    }
                }
                TableViewColumn {
                    id: recCol12
                    title: "recCol2"
                    role: "recCol2"
                    movable: false
                    resizable: false
                    delegate: Rectangle {
                        color: "Transparent"
                        Text {
                            anchors.centerIn: parent
                            text: "\uf247"
                            font.family:fontawesome.name
                            font.pixelSize: CommonFunction.getIconFontByParentSize(parent.width) *2
                            color: "red"
                            //font.pixelSize: CommonFunction.getIconFontByParentSize(parent) *10
                        }
                    }
                    width: tableView.viewport.width / 12
                }
                TableViewColumn {
                    id: recDateCol
                    title: "RecDate"
                    role: "RecDateTime"
                    movable: false
                    resizable: false
                    width: tableView.viewport.width / 6
                    delegate: Rectangle {
                        color: "Transparent"
                        anchors .fill:  parent
                        Text {
                            //.centerIn:  parent
                            anchors{left: parent.left;right: parent.right}
                            wrapMode: Text.WordWrap
                            text: Qt.formatDateTime (styleData.value, "dd/MM/yyyy hh:mm:ss")// styleData.value.ToString("yyyy-MM-dd HH:mm")
                            font.pixelSize: CommonFunction.getTextFontByParentSize(tableView.viewport.width / 12) * 2
                            //font.pixelSize: CommonFunction.getIconFontByParentSize(parent) *10
                        }
                    }
                }
                TableViewColumn {
                    id: recPosCol
                    title: "RecPos"
                    role: "RecPos"
                    movable: false
                    resizable: false
                    width: tableView.viewport.width / 3
                    delegate: Rectangle {
                        color: "Transparent"
                        Text {
                            anchors.centerIn: parent
                            text: styleData.value
                            font.pixelSize: CommonFunction.getTextFontByParentSize(tableView.viewport.width / 12) * 2
                        }
                    }
                }
                model: myModel
            }
        }
        Rectangle {
            color: "Transparent"
            anchors{top :tableViewRectanle.bottom;bottom: parent.bottom;left: parent.left;right: parent.right}
            Rectangle
            {
                color: "Transparent"
                anchors{left: parent.left;top: parent.top;bottom: parent.bottom}
                width: parent.width /2
                CommonButton
                {
                    height: parent.height / 2
                    width: parent.width / 3
                    anchors.centerIn: parent
                    text: String.fromCharCode( 0xf100)
                    fontFamily :fontawesome.name
                    fontSize:  CommonFunction.getIconFontByParentSize(parent.width /2)
                    onClicked:
                    {
                        if(tableView.currentRow >0)
                        {
                            tableView.selection.clear()
                            tableView.currentRow = tableView.currentRow -1
                            tableView.selection.select(tableView.currentRow)
                            tableView.activated(tableView.currentRow)
                        }
                    }
                }
            }
            Rectangle
            {
                color: "Transparent"
                anchors{right: parent.right;top: parent.top;bottom: parent.bottom;  }
                width: parent.width /2
                CommonButton
                {
                    height: parent.height / 2
                    width: parent.width / 3
                    anchors.centerIn: parent
                    text: String.fromCharCode( 0xf101)
                    fontFamily :fontawesome.name
                    fontSize:  CommonFunction.getIconFontByParentSize(parent.width) /2
                    onClicked:
                    {
                        if(tableView.currentRow < tableView.rowCount -1)
                        {
                            tableView.selection.clear()
                            tableView.currentRow = tableView.currentRow +1
                            tableView.selection.select(tableView.currentRow)
                            tableView.activated(tableView.currentRow)
                        }
                    }
                }
            }
            MessageDialog {
                id: dialogDelete
                title: qsTr("Remove record")
                text: qsTr("Confirm the deletion of log entries")
                icon: StandardIcon.Warning
                standardButtons: StandardButton.Ok | StandardButton.Cancel
                // If the answer ...
                onAccepted: {
                    /* ... remove the line by id, which is taken from the data model
                         * on the line number in the presentation
                         * */
                    database.recordedListRemoveRecord(myModel.getId(tableView.currentRow))
                    myModel.updateModel();
                }
            }

        }

    }
    Rectangle {
        color: "Transparent"
        id: rightPanel
        anchors{top :parent.top; right : parent.right;bottom:  parent.bottom; }
        width: parent.width / 10
        GridLayout {
            anchors.centerIn: parent
            width: parent.width * 95 / 100
            height: parent.height
            id:rightGrid
            columns:  1;
            rows: 7;
            Rectangle {
                color: "Transparent"
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                CloseButton
                {
                    anchors.fill: parent
                }
            }
            Rectangle {
                color: "Transparent"
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                SortButton
                {
                    anchors .fill: parent

                }
            }
            Rectangle {
                color: "Transparent"
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                FilterButton
                {
                    anchors .fill: parent
                }

            }
            Rectangle {
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                AllButton
                {
                    anchors .fill: parent
                }
            }
            Rectangle {
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                CommonButton
                {
                    text:qsTr( "Live View")
                    fontColor: "red"
                    anchors.fill: parent
                    onClicked:
                    {
                        stack.pop();
                    }
                }

            }
            Rectangle {
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                CommonButton
                {
                    anchors.fill: parent
                    text: ""
                    Text
                    {
                        id:btnLinUpText
                        anchors.centerIn: parent
                        text: String.fromCharCode( 0xf062    )
                        font.family: fontawesome.name
                        font.pixelSize: CommonFunction.getIconFontByParentSize(parent.width)

                    }
                    Text
                    {
                        anchors.top:btnLinUpText.bottom
                        text: qsTr("Line Up")
                        font.pixelSize: CommonFunction.getTextFontByParentSize(parent.width)
                        width: parent.width
                        horizontalAlignment:  Text.AlignHCenter
                        color:qsTr( "blue")

                    }
                }
            }
            Rectangle {
                color: "Transparent"
                Layout.columnSpan: 1

                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                CommonButton
                {
                    anchors.fill: parent
                    text: ""
                    Text
                    {
                        id:btnLineDownText
                        anchors .centerIn: parent
                        text: String.fromCharCode(  0xf063  )
                        font.family: fontawesome.name
                        font.pixelSize: CommonFunction.getIconFontByParentSize(parent.width)
                    }
                    Text
                    {
                        anchors .top:btnLineDownText.bottom
                        text:qsTr( "Line Down")
                        font.pixelSize: CommonFunction.getTextFontByParentSize(parent.width)
                        width: parent.width
                        horizontalAlignment:  Text.AlignHCenter
                        color:qsTr( "blue")

                    }
                }
            }
        }
    }
}
