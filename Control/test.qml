import QtQuick 2.0
import "../commonFunction.js" as CommonFunction
ListView {
    snapMode: ListView.SnapToItem
    delegate: Component {
        Text {
            elide: Text.ElideMiddle
            text: "A really, really long string that will require eliding."
            var x = CommonFunction.getIconFontByParentSize(100)
        }
    }
}
