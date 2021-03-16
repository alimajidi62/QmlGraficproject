import QtQuick 2.0

Item {
    id: cameraListButton
    property alias value : popup.currentValue
    property alias model : popup.model

    width : 150
    height: 75

    visible: model.length > 0
/*
    BorderImage {
        id: buttonImage
        source: "images/toolbutton.sci"
        width: cameraListButton.width; height: cameraListButton.height
    }
*/
    CommonButton {
        anchors.fill: parent
        text:"Camera list"
        //text: popup.currentItem != null ? popup.currentItem.displayName : "No Device"

        onClicked:
        {
            popup.toggle()
        }
    }

    CameraListPopup {
        id: popup
        z:10

        anchors{left: parent.right;rightMargin: 16;top: parent.bottom;}
        visible: opacity > 0

        onSelected: popup.toggle()

    }
}
