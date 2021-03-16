/*
CommonButton Control
 */
import QtQuick 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.2

import QtQuick 2.0
import "../commonFunction.js" as CommonFunction
Button {
    property string fontFamily : "Arail"
        property int  fontSize : CommonFunction.getTextFontByParentSize(parent.width )
        property string fontColor : "blue"
    text: ""
    style: ButtonStyle {
        label: Text {
            renderType: Text.NativeRendering
            font{family: fontFamily;pixelSize: fontSize}
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: fontColor
            text: control.text
        }
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
