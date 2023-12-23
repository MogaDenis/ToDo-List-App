
class ToDoItem {
  late String _description;
  late int _id;

  static int idCounter = 0;

  ToDoItem(String description) {
    _description = description;
    _id = idCounter;
    idCounter++;
  }

  String getDescription() {
    return _description;
  }

  int getID() {
    return _id;
  }

  void changeDescription(String newDescription) {
    _description = newDescription;
  }

  @override
  bool operator ==(Object other) {
    if (other is! ToDoItem) {
      return false;
    }

    return _id == other._id;
  }
  
  @override
  int get hashCode => _id;
}