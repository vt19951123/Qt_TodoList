import QtQuick
import QtQuick.Controls

Item {

    property string context: ""
    property bool completed: false

    signal taskCompleted()

    Rectangle {
        anchors.fill: parent
        anchors.margins: 10
        // color: "lightblue"
        CheckBox {
            id: checkBoxId
            anchors.verticalCenter: parent.verticalCenter
            checked: completed

            onCheckedChanged: {
                taskCompleted()
            }
        }

        Text {
            anchors.left: checkBoxId.right
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr(context)
            verticalAlignment: Text.AlignVCenter
            font.strikeout: completed
        }
    }


}
