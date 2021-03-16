/*
  MediaButton Control
  */
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.2
import QtQuick 2.0
Button {
    id:theButton   
    Text {
        text:   "\uf008"
        anchors{top: parent.top;topMargin: parent.height / 10;fill: parent}
        //verticalAlignment: Text.AlignTop
        horizontalAlignment:Text.AlignHCenter
        font{ pixelSize:CommonFunction.getIconFontByParentSize(parent.width);  family: fontawesome.name}
    }
    Text { text:   "\uf0dd"
       anchors{right:   parent.right;rightMargin: width ;bottom: parent.bottom}
        verticalAlignment: Text.AlignLeft
        horizontalAlignment:Text.AlignRight
        rotation: 270
        font{ pixelSize:parent.width / 5; family: fontawesome.name}
    }
    Text {
        color: "blue"
        anchors{bottom: parent.bottom;left: parent.left;leftMargin: parent.width / 10;bottomMargin: parent.height / 10}
        font{ family: "Arail" ; bold: true ; pixelSize: CommonFunction.getTextFontByParentSize(parent.width ) }
        text: "Media"
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