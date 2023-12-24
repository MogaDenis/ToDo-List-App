import 'package:flutter/material.dart';
import 'package:todo_list_app/constants/constants.dart';
import 'package:todo_list_app/model/todo_item.dart';
import 'package:todo_list_app/notifications/notifications.dart';

class EditItemScreen extends StatefulWidget {
  late final ToDoItem _toDoItem;
  late final BuildContext _parentContext;
  late final TextEditingController _textEditingController;

  EditItemScreen(ToDoItem toDoItem, BuildContext parentContext, {super.key}) {
    _toDoItem = toDoItem;
    _parentContext = parentContext;
    _textEditingController =
        TextEditingController(text: toDoItem.getDescription());
  }

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(style: TextStyleConstants.textStyleLarge, 'Edit note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: TextField(
            style: TextStyleConstants.textStyleSmall,
            controller: widget._textEditingController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget._toDoItem
              .changeDescription(widget._textEditingController.text);
          const ModifiedItemNotification().dispatch(widget._parentContext);
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(style: TextStyleConstants.textStyleSmall, "Save"),
        ),
      ),
    );
  }
}
