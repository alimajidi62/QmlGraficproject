/*
LRFButton Control
  */
import QtQuick 2.0
//import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.2
import "../commonFunction.js" as CommonFunction


//Import the declarative plugins
import QtQuick 2.0


Button {



    id:theButton


    onClicked:
    {

    }


    Text { text:   "\uf2d4"
        anchors{fill:  parent;topMargin: parent.height / 10;}

        //verticalAlignment: Text.AlignTop
        horizontalAlignment:Text.AlignHCenter

        //anchors.fill: parent
        font.pixelSize:CommonFunction.getIconFontByParentSize(parent.width)
        font.family: fontawesome.name
    }



    Text {

        id: popupIcon
        text:   "\uf0dd"
        anchors{left:    parent.left;leftMargin:  width;bottom: parent.bottom}
        //.bo: parent.height / 10;

        verticalAlignment: Text.AlignLeft
        horizontalAlignment:Text.AlignLeft

        rotation: 90
        font.pixelSize:parent.width / 5
        font.family: fontawesome.name
    }
    Text {

        color: "blue"
        //  .top:   theIcon.bottom
        anchors{bottom: parent.bottom;left: popupIcon.left;leftMargin: parent.width / 10;bottomMargin: parent.height / 10}
        font.family: "Arail"
        font.bold: true
        font.pixelSize: CommonFunction.getTextFontByParentSize(parent.width )
        text: "LRF"
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

        }
    }
}