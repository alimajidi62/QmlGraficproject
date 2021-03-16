/*
CTRLButton Control
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
    property alias value : popup.currentValue
    property alias model : popup.model
    onClicked:
    {
        popup.toggle()
    }
    Text { text:   "\uf03d"
        anchors{top: parent.top;topMargin: parent.height / 10; fill:parent}
        horizontalAlignment:Text.AlignHCenter
        font{pixelSize:CommonFunction.getIconFontByParentSize(parent.width); family: fontawesome.name}
    }
    Text { text:   "\uf0dd"
        anchors{right:   parent.right;rightMargin: width;bottom: parent.bottom}
        verticalAlignment: Text.AlignLeft
        horizontalAlignment:Text.AlignRight
        rotation: 270
        font{ pixelSize:parent.width / 5; family: fontawesome.name}
    }
    Text {
        color: "blue"
        anchors{bottom: parent.bottom;left: parent.left;leftMargin: parent.width / 10;bottomMargin: parent.height / 10}
        font{family: "Arail"; bold: true; pixelSize: CommonFunction.getTextFontByParentSize(parent.width )}
        text: "CTRL"
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
    CameraListPopup {
        id: popup
        anchors{left:  parent.right;top: parent.top}
        visible: opacity > 0
        onSelected: popup.toggle()
    }
}
