import 'package:flutter/material.dart';
import 'package:todo_list_app/model/todo_item.dart';
import 'package:todo_list_app/notifications/notifications.dart';

class EditItemScreen extends StatefulWidget {
  late final ToDoItem _toDoItem;
  late final BuildContext _parentContext;

  EditItemScreen(ToDoItem toDoItem, BuildContext parentContext, {super.key}) {
    _toDoItem = toDoItem;
    _parentContext = parentContext;
  }

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Screen')),
      floatingActionButton: FloatingActionButton(onPressed: () {
        widget._toDoItem.changeDescription("It works");
        const ModifiedItemNotification().dispatch(widget._parentContext);
      },
      child: const Icon(Icons.edit),
      ),
    );
  }
}