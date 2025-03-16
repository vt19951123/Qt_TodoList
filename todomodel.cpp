#include "todomodel.h"

TodoModel::TodoModel(QObject* parent) : QAbstractListModel(parent) {

    m_items.append({QString("Hoc Qt"), false});
    m_items.append({QString("Hoc Qt"), false});
    m_items.append({QString("Hoc Qt"), false});
}

int TodoModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid()) return 0;

    return m_items.size();
}

QVariant TodoModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || (index.row() < 0 || index.row() >= m_items.size()) )
        return QVariant();

    const TodoItem& item = m_items[index.row()];

    switch(role) {
    case TEXT_ROLE:
        return item.text;
    case COMPLETE_ROLE:
        return item.completed;
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> TodoModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[TEXT_ROLE] = "text";
    roles[COMPLETE_ROLE] = "completed";

    return roles;
}

bool TodoModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    bool ret = false;

    if (!index.isValid() || (index.row() < 0 || index.row() >= m_items.size()) )
        return false;

    TodoItem& item = m_items[index.row()];

    switch(role) {
    case TEXT_ROLE:
        item.text = value.toString();
        break;
    case COMPLETE_ROLE:
        item.completed = value.toBool();
        break;
    default:
        return false;
    }

    emit dataChanged(index, index, {role});

    return true;
}

void TodoModel::addItem(const QString &text)
{
    beginInsertRows(QModelIndex(), m_items.size(), m_items.size());

    m_items.append({text, false});

    endInsertRows();

}

bool TodoModel::setCompleted(const int &index, const bool &value)
{
    if (index < 0 || index >= m_items.size()) return false;

    QModelIndex modelIndex = createIndex(index, 0);
    this->setData(modelIndex, !value, COMPLETE_ROLE);

    return true;
}

bool TodoModel::removeItem(const int &index)
{
    if (index < 0 || index >= m_items.size()) return false;

    beginRemoveRows(QModelIndex(), m_items.size(), m_items.size());

    m_items.removeAt(index);

    endRemoveRows();

    return true;
}
