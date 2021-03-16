/*
  CameraListPopup control
  */
import QtQuick 2.0

Popup {
    id: cameraListPopup
    property alias model : view.model
    property variant currentValue
    property variant currentItem :0;// model[view.currentIndex]
    property int itemWidth : 200
    property int itemHeight : 50
    width: itemWidth + view.margins*2
    height: view.count * itemHeight + view.margins*2
    signal selected
    ListView {
        id: view
        anchors{fill: parent;margins: 5}
        snapMode: ListView.SnapOneItem
        highlightFollowsCurrentItem: true
        highlight: Rectangle { color: "#D1DEE4"; radius: 5 }
        currentIndex: 0
        delegate: Item {
            width: cameraListPopup.itemWidth
            height: cameraListPopup.itemHeight
            Text {
                text: modelData.displayName
                anchors{fill: parent;margins: 5}
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                color: "blue"
               font{ bold: true;pixelSize: 14}
                style: Text.Raised
                styleColor: "#D1DEE4"
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    view.currentIndex = index
                    cameraListPopup.currentValue = modelData.deviceId
                    cameraListPopup.selected(modelData.deviceId)
                }
            }
        }
    }
}
