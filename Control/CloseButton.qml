/*
  CloseButton Control
 */
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.2
import "../commonFunction.js" as CommonFunction
import QtQuick 2.0

CommonButton
{

    text: "\uf00d"
    anchors.centerIn: parent;
    width: height
    fontFamily:  fontawesome.name;
    fontSize:  CommonFunction.getIconFontByParentSize(parent.width)
    onClicked:
    {
        Qt.quit()
    }
}
