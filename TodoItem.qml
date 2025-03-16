import QtQuick
import QtQuick.Controls

Item {

    height: itemText.height > 40 ? itemText.height : 40
    property string context: ""
    property bool completed: false

    signal taskCompleted()
    signal removeTask()

    Rectangle {
        anchors.fill: parent
        anchors.margins: 2
        color: "lightblue"
        CheckBox {
            id: checkBoxId
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            Component.onCompleted: {
                checkBoxId.checked = completed
            }

            onClicked: {
                taskCompleted()
            }
        }

        Text {
            id: itemText
            width: 300
            anchors.left: checkBoxId.right
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr(context)
            font.strikeout: completed
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
        }

        Rectangle {
            id: removeButton
            width: 25
            height: 25
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            color: "lightgray"
            border.width: 1
            border.color: "gray"

            Text {
                id: crossText
                anchors.centerIn: parent
                text: qsTr("✕")
                verticalAlignment: Text.AlignVCenter
            }

            MouseArea {
                anchors.fill: parent
                onReleased: {
                    removeTask()
                }
            }
        }
    }


}
