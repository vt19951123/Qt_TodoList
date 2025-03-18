import QtQuick
import QtQuick.Controls

Item {



    Rectangle {
        width: parent.width
        height: parent.height
        border.width: 2
        border.color: "gray"

        ListView {
            id: listviewId
            anchors.fill: parent
            clip: true

            // Animation when add an item
            add: Transition {
                NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 300 }
                NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 300 }
            }

            // Animation when remove an item
            remove: Transition {
                NumberAnimation { property: "opacity"; from: 1.0; to: 0; duration: 300 }
                NumberAnimation { property: "scale"; from: 1.0; to: 0; duration: 300 }
            }

            displaced: Transition {
                NumberAnimation { properties: "x,y"; duration: 200; easing.type: Easing.OutQuad }
            }

            ScrollBar.vertical: ScrollBar { }

            model: TodoModel
            delegate: TodoItem {
                width: listviewId.width
                context: model.text
                completed: model.completed

                onTaskCompleted: {
                    TodoModel.setCompleted(index, model.completed)
                }

                onRemoveTask: {
                    TodoModel.removeItem(index)
                }
            }
        }
    }


    // ListModel {
    //     id: toDoListModel

    //     ListElement { context: "Hoc Qt"; completed: false }
    //     ListElement { context: "Xây dựng ứng dụng To Do List"; completed: false }
    //     ListElement { context: "Tìm hiểu về CMake"; completed: false }
    // }
}
