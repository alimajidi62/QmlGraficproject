/*
  CameraPropertyPopup Control
 */
import QtQuick 2.0

Popup {
    id: propertyPopup
    property alias model : view.model
    property variant currentValue
    property variant currentItem : model.get(view.currentIndex)
    property int itemWidth : 100
    property int itemHeight : parent.height
    property int columns : 2
    width: columns*itemWidth + view.margins*2
    height: Math.ceil(model.count/columns)*itemHeight + view.margins*2 + 25
    signal selected
    function indexForValue(value) {
        for (var i = 0; i < view.count; i++) {
            if (model.get(i).value == value) {
                return i;
            }
        }
        return 0;
    }
    GridView {
        id: view
        anchors{fill: parent;margins: 5}
        cellWidth: propertyPopup.itemWidth
        cellHeight: propertyPopup.itemHeight
        snapMode: ListView.SnapOneItem
        highlightFollowsCurrentItem: true
        highlight: Rectangle { color: "gray"; radius: 5 }
        currentIndex: indexForValue(propertyPopup.currentValue)
        delegate: Item {
            width: propertyPopup.itemWidth
            height: 70
            Image {
                anchors.centerIn: parent
                source: icon
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    propertyPopup.currentValue = value
                    propertyPopup.selected(value)
                }
            }
        }
    }

    Text {
        anchors{bottom: parent.bottom;bottomMargin: 8;left: parent.left;leftMargin: 16}
        color: "#ffffff"
        font{ bold: true; pixelSize: 14}
        style: Text.Raised;
        styleColor: "black"
        text: view.model.get(view.currentIndex).text
    }
}
