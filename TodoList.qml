import QtQuick

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


    ListModel {
        id: toDoListModel

        ListElement { context: "Hoc Qt"; completed: false }
        ListElement { context: "Xây dựng ứng dụng To Do List"; completed: false }
        ListElement { context: "Tìm hiểu về CMake"; completed: false }
    }
}
