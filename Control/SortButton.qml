/*
  SortButton Control
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
    Text {
        id: popupIcon
        text:   "\uf0dd"
        anchors{left:    parent.left;leftMargin:  width;bottom: parent.bottom}
        verticalAlignment: Text.AlignLeft
        horizontalAlignment:Text.AlignLeft
        rotation: 90
        font{ pixelSize:parent.width / 5; family: fontawesome.name}
    }
    Text {
        color: "blue"
      //  .top:   theIcon.bottom
        anchors.centerIn: parent
        font{ family: "Arail"; bold: true; pixelSize: CommonFunction.getTextFontByParentSize(parent.width )}
        text: "SORT"
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
