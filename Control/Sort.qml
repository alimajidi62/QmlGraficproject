import QtQuick 2.7
//import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.2
import QtQuick 2.0
import "../commonFunction.js" as CommonFunction

//Import the declarative plugins
import QtQuick 2.0



Button {



    id:theButton


    onClicked:
    {

    }




    Text { text:   String.fromCharCode(0xf0dd   )
        anchors.right:   parent.right
        anchors.rightMargin: width
        anchors.bottom: parent.bottom
        //anchors.bo: parent.height / 10;

        verticalAlignment: Text.AlignLeft
        horizontalAlignment:Text.AlignRight

        rotation: 270
        font.pixelSize:parent.width / 5
        font.family: fontawesome.name
    }



    Text {

        color: "blue"
        //  anchors.top:   theIcon.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: parent.width / 10

        anchors.bottomMargin: parent.height / 10
        font.family: "Arail"
        font.bold: true
        font.pixelSize: CommonFunction.getTextFontByParentSize(parent.width )
        text: "Sort"
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
