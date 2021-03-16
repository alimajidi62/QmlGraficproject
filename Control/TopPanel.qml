/*
  topPanel Control
  */
import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.0
Rectangle {
    color: "#D1DEE4"
    id : topPanelUi
    height: 20
    anchors{top: parent.top;left: parent.left; right: parent.right}
    GridLayout {
        anchors.fill: parent
        id:topGrid
        columns: 20
        Rectangle {
            color: "Transparent"
            Layout.columnSpan: 1
            Layout.rowSpan: 1
            Layout.preferredWidth: 2 *  parent.width / topGrid.columns
            Layout.fillHeight: true

        }
        Rectangle {
            color: "Transparent"
            Layout.rowSpan:  1
            Layout.fillHeight: true
            Layout.preferredWidth: 1 *  parent.width / topGrid.columns
            Label {
                text: "LRF"
                anchors.fill: parent
                font.pixelSize: 22
            }
        }
        Rectangle {
            color: "Transparent"
            Layout.rowSpan:  1
            Layout.fillHeight: true
            Layout.preferredWidth: 3 *  parent.width / topGrid.columns
            Label {
                text: "00:16:42"
                anchors.fill: parent
                font.pixelSize: 22
            }
        }
        Rectangle {
            color: "Transparent"
            Layout.rowSpan:  1
            Layout.fillHeight: true
            Layout.preferredWidth: 1 *  parent.width / topGrid.columns
            Label {
                text: "LOS"
                anchors.fill: parent
                font.pixelSize: 22
            }
        }
        Rectangle {
            color: "Transparent"
            Layout.rowSpan:  1
            Layout.fillHeight: true
            Layout.preferredWidth: 5 *  parent.width / topGrid.columns
            Label {
                id: lblDate
                text: "...."
                anchors.fill: parent
                font{pixelSize: 22;   family: "Helvetica"}
            }
        }
        Rectangle {
            color: "Transparent"
            Layout.rowSpan:  1
            Layout.fillHeight: true
            Layout.preferredWidth: 1 *  parent.width / topGrid.columns
            Label {
                font{  family: fontawesome.name;  pixelSize: 22}
                text: "\uf0e8"
                anchors.fill: parent
            }
        }
        Rectangle {
            color: "Transparent"
            Layout.rowSpan:  1
            Layout.fillHeight: true
            Layout.preferredWidth: 1 *  parent.width / topGrid.columns
            Image {
                //    id: name
                source: "../images/serial.png"
                height: 30;
                width: 50
            }
        }

        Rectangle {
            color: "Transparent"
            Layout.rowSpan:  1
            Layout.fillHeight: true
            Layout.preferredWidth: 1 *  parent.width / topGrid.columns
            Label {
                //rightPadding:0
                text: "SU"
                font{ pixelSize: 27;family: "Helvetica"; bold: true }
            }
        }
    }
    Timer {
        interval: 500; running: true; repeat: true
        property int hours
        property int minutes
        property int seconds
        property real shift
        property bool night: false
        property bool internationalTime: true //Unset for local time
        onTriggered:
        {
            var datee = new Date()
            lblDate.text =  Qt.formatDateTime (datee, "dd/MM/yyyy hh:mm:ss") + " (" + datee.getTimezoneOffset().toString()+ ")"
        }
    }

}
