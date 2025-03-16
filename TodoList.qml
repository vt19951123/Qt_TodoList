import QtQuick

Item {

    width: parent.width
    height: 400

    Rectangle {
        width: parent.width
        height: parent.height
        border.width: 2
        border.color: "gray"

        ListView {
            anchors.fill: parent
            model: TodoModel
            delegate: TodoItem {
                width: parent.width
                height: 40
                context: model.text
                completed: model.completed

                onTaskCompleted: {
                    TodoModel.setCompleted(index, model.completed)
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
