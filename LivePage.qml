/*
  Live Page
  */
import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.0
import "Control"
import QtMultimedia 5.4
import "commonFunction.js" as CommonFunctuions

Rectangle
{
    color: "#D1DEE4"
    Rectangle {
        color: "#D1DEE4"
        id: leftPanel
        width :  parent.width /10
        anchors{ top :parent.top; left : parent.left ;bottom:  parent.bottom}
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
                border.width: 2
                color: "red"
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
                DayNightButton
                {
                    anchors.fill: parent

                }

            }
            Rectangle {
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                CTRLButton
                {
                    model: QtMultimedia.availableCameras
                    anchors.fill: parent
                }

            }
            Rectangle {
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                TRKButon
                {
                    anchors.fill: parent
                }

            }
            Rectangle {
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                FocusButton
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
                CommonButton
                {
                    anchors.fill: parent
                    fontFamily: fontawesome.name
                    fontSize: parent.width / 3
                    fontColor: "black"
                    text: "\uf010"
                }
            }

        }

    }
    Rectangle {
        id: mainPanel
        anchors{ top :parent.top; right : rightPanel.left;left: leftPanel.right;bottom:  parent.bottom}
        color:  "black"
        Layout.columnSpan: 1
        Image {
            id:imgDefault
            source: "images/No_Image.jpg"
            anchors .fill: parent
        }
        Camera {
            id: camera
            captureMode: Camera.CaptureStillImage
            onCameraStateChanged:
            {
                imgDefault.visible = false
            }
        }
        VideoOutput {
            id: viewfinder
            anchors .fill: parent
            source: camera
            fillMode:VideoOutput.Stretch
        }
    }
    Rectangle {
        color: "Transparent"
        //color: "red"
        id: rightPanel
        anchors{ top :parent.top; right : parent.right;bottom:  parent.bottom;}
        width: parent.width / 10
        GridLayout {
            width: parent.width * 95 / 100
            height: parent.height
            anchors .centerIn: parent
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
                LRFButton
                {
                    anchors.fill: parent
                    //   bold: true
                    //pixelSize:  30
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
                CommonButton
                {
                    anchors.fill: parent
                    text: qsTr( "REC")
                    onClicked: {
                        var datee = new Date()
                        var x = Math.random() * 1000
                        x  = x.toFixed(0)
                        database.recordedListInserIntoTable ( x , "TRG" + x , datee , x,x +1 ,x +2);
                        myModel.updateModel() // And updates the data model with a new record
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
                    text: qsTr( "RecordedList")
                    fontColor: "red"
                    anchors.fill: parent
                    onClicked:
                    {
                        stack.push(recordedListPageView)
                    }
                }

            }
            Rectangle {
                Layout.columnSpan: 1
                Layout.rowSpan: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                TargetButton
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
                CommonButton
                {
                    anchors.fill: parent
                    fontFamily: fontawesome.name
                    fontSize: parent.width / 3
                    fontColor: "black"
                    text: "\uf00e"
                }
            }
        }
    }
}
