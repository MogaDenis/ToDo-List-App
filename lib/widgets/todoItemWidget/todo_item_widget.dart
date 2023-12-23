import 'package:flutter/material.dart';
import 'package:todo_list_app/controller/controller.dart';
import 'package:todo_list_app/model/todo_item.dart';
import 'package:todo_list_app/notifications/deleted_item_notification.dart';

class ToDoItemWidget extends StatefulWidget {
  late final ToDoItem _toDoItem;
  late final Controller _toDoItemsController;

  ToDoItemWidget(ToDoItem toDoItem, Controller toDoItemsController, {super.key}) {
    _toDoItem = toDoItem;
    _toDoItemsController = toDoItemsController;
  }

  @override
  State<ToDoItemWidget> createState() => _ToDoItemWidgetState();
}

class _ToDoItemWidgetState extends State<ToDoItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.fromLTRB(10, 10, 50, 10),
      decoration: const BoxDecoration(
        color:  Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(icon: const Icon(Icons.edit), onPressed: () {
                setState(() {
                  widget._toDoItem.changeDescription("Changed ${widget._toDoItem.getID()}");
                });
              }),
              IconButton(icon: const Icon(Icons.delete), onPressed: () {
                widget._toDoItemsController.removeItem(widget._toDoItem); // Delete the item.
                const DeletedItemNotification().dispatch(context); // Send notification to the parent widget.
              })
            ],
          ),
          Text((widget._toDoItem.getDescription().length > 25) ? "${widget._toDoItem.getDescription().substring(0, 25)}..." : widget._toDoItem.getDescription()),      
        ],
      )
    );
  }
}