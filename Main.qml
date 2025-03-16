import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: mainWindow
    width: 400
    height: 600
    visible: true
    title: qsTr("Hello World")
    color: "#f5f5f5"

    Column {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("To Do List")
            font.pixelSize: 24
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#333333"
        }

        Rectangle {
            id: recField
            width: parent.width
            height: 20
            color: "#f5f5f5"

            Row {
                spacing: 10

                TextField {
                    id: newTaskInput
                    width: 300
                    height: recField.height
                    placeholderText: qsTr("Nhập công việc mới...")

                    Keys.onReturnPressed: {
                        if(text.length > 0) {
                            TodoModel.addItem(text)
                        }
                    }
                }

                Rectangle {
                    id: addButton
                    width: 70
                    height: recField.height
                    color: "gray"

                    Text {
                        anchors.fill: parent
                        horizontalAlignment: Text.AlignHCenter
                        text: qsTr("Thêm")
                        font.pixelSize: 12
                        color: "black"
                    }

                    MouseArea {
                        anchors.fill: parent
                        onReleased: {
                            if (newTaskInput.text.length > 0) {
                                TodoModel.addItem(newTaskInput.text)
                            }
                        }
                    }
                }
            }
        }

        TodoList {
            width: parent.width
            height: 400
        }

    }
}
