/*
  main class of qml side

  */
import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.0
import QtMultimedia 5.4
import "Control"
import QtQuick.Dialogs 1.2
ApplicationWindow {
    visible: true
    width: 1280
    height: 600
    MessageDialog {
        id:dialogClose
        text: qsTr("Closing...")
        icon: "Warning"
        informativeText:qsTr( "Do you want to exit?")
        standardButtons: MessageDialog.Ok | MessageDialog.Cancel
        onAccepted: Qt.quit()
    }
    onClosing: {
        close.accepted = false
        dialogClose.open()
    }
    color: "#D1DEE4"
    //    title: qsTr("Hello World")
    FontLoader { id: fontawesome ; source:  "fonts/FontAwesome.otf" }
    LivePage{
        id: livePageView
    }
    RecordedListPage{
        id: recordedListPageView
      //  anchors.fill: parent
    }
    GISPage{
        id: gISPageView
        anchors.fill: parent
    }
    Rectangle
    {
        color: "#D1DEE4"
        anchors.fill: parent;
       TopPanel
        {
            color: "#D1DEE4"
            id:topPanel
            anchors
            {
                top:parent.top

            }
            height: 30
        }
        StackView {
            id: stack
            initialItem: livePageView
            anchors { top: topPanel.bottom ; bottom: parent.bottom ; left: parent.left; right: parent.right }
        }
    }
}

