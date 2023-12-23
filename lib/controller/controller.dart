import 'package:todo_list_app/model/todo_item.dart';
import 'package:todo_list_app/repository/repository.dart';

class Controller {
  late Repository<ToDoItem> _repository;

  Controller(Repository<ToDoItem> repository) {
    _repository = repository;
  }

  List<ToDoItem> getItems() {
    return _repository.getItems();
  }

  bool addItem(ToDoItem item) {
    return _repository.addItem(item);
  }

  int getIndexOf(ToDoItem item) {
    return _repository.getIndexOf(item);
  }

  ToDoItem getItemAtIndex(int index) {
    return _repository.getItemAtIndex(index);
  }

  bool contains(ToDoItem item) {
    return _repository.contains(item);
  }

  bool removeItem(ToDoItem item) {
    return _repository.removeItem(item);
  }

  ToDoItem? removeItemByIndex(int index) {
    return _repository.removeItemByIndex(index);
  }

  bool replaceItem(ToDoItem oldItem, ToDoItem newItem) {
    return _repository.replaceItem(oldItem, newItem);
  }
}