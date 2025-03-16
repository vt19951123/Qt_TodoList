#ifndef TODOMODEL_H
#define TODOMODEL_H

#include <QAbstractListModel>
#include <QVector>
#include <QString>

struct TodoItem {
    QString text;
    bool completed;
};

class TodoModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit TodoModel(QObject* parent = nullptr);

    enum {
        TEXT_ROLE,
        COMPLETE_ROLE
    };

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;
    bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;

    Q_INVOKABLE void addItem(const QString& text);
    Q_INVOKABLE bool setCompleted(const int& index, const bool& value);
    Q_INVOKABLE bool removeItem(const int& index);

private:
    QVector<TodoItem> m_items;

};

#endif // TODOMODEL_H
