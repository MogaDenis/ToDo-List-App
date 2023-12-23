import 'package:todo_list_app/model/todo_item.dart';
import 'package:todo_list_app/repository/repository.dart';

class ToDoItemsRepository implements Repository<ToDoItem> {
  late List<ToDoItem> _items;

  ToDoItemsRepository() {
    _items = List<ToDoItem>.empty(growable: true);
  }

  @override
  bool addItem(ToDoItem item) {
    if (_items.contains(item)) {
      return false;
    }

    _items.insert(0, item);
    // _items.add(item);
    return true;
  }

  @override
  int getIndexOf(ToDoItem item) {
    return _items.indexOf(item);
  }

  @override
  ToDoItem getItemAtIndex(int index) {
    return _items[index];
  }

  @override
  List<ToDoItem> getItems() {
    return _items;
  }

  @override
  bool contains(ToDoItem item) {
    return _items.contains(item);
  }

  @override
  bool removeItem(ToDoItem item) {
    return _items.remove(item);
  }

  @override
  ToDoItem? removeItemByIndex(int index) {
    if (index < 0 || index >= _items.length) {
      return null;
    }

    return _items.removeAt(index);
  }

  @override
  bool replaceItem(ToDoItem oldItem, ToDoItem newItem) {
    for (ToDoItem item in _items) {
      if (item == oldItem) {
        item = newItem;
        return true;
      }
    }

    return false;
  }
}