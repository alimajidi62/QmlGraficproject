/*
  DayNightButton Control
  */
import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.2
import QtQuick 2.0
import "../commonFunction.js" as CommonFunction
Button {

    id:theButton
    Rectangle{
        id:leftBox
        anchors{left: parent.left;top:  parent.top;}
        height: parent.height /2
        width:  parent.width /10
        color: 'black'
    }
    Rectangle{
        id:leftBox2
        anchors{left:  parent.left ;bottom:  parent.bottom}
        height: parent.height /2
        width:  parent.width /10
        color: 'silver'
    }
    Text {
        renderType: Text.NativeRendering
        color: "blue"
        anchors{bottom: parent.bottom;left: parent.left;leftMargin: parent.width / 10;bottomMargin: parent.height / 10}
        font{ family: "Arail";  bold: true; pixelSize: CommonFunction.getTextFontByParentSize(parent.width )}
        text: "DAY"
    }
    style: ButtonStyle {
        background: Rectangle {
            implicitWidth: 150
            implicitHeight: 75
            border.width: control.activeFocus ? 2 : 1
            border.color: "#888"
            radius: 4
            gradient: Gradient {
                GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
            }
            Text { text: "\uf0a3"
                anchors{top: parent.top;topMargin: parent.height / 10;fill: parent}
                horizontalAlignment:Text.AlignHCenter
                font{pixelSize:CommonFunction.getIconFontByParentSize(parent.width); family: fontawesome.name}
            }
        }
    }
}
