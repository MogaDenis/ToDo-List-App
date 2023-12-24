import 'package:flutter/material.dart';
import 'package:todo_list_app/constants/constants.dart';
import 'package:todo_list_app/controller/controller.dart';
import 'package:todo_list_app/model/todo_item.dart';
import 'package:todo_list_app/notifications/notifications.dart';
import 'package:todo_list_app/widgets/editTodoItemWidget/edit_todo_item_widget.dart';

class ToDoItemWidget extends StatefulWidget {
  late final ToDoItem _toDoItem;
  late final Controller _toDoItemsController;
  late final BuildContext _parentContext;

  ToDoItemWidget(ToDoItem toDoItem, Controller toDoItemsController,
      BuildContext parentContext,
      {super.key}) {
    _toDoItem = toDoItem;
    _toDoItemsController = toDoItemsController;
    _parentContext = parentContext;
  }

  @override
  State<ToDoItemWidget> createState() => _ToDoItemWidgetState();
}

class _ToDoItemWidgetState extends State<ToDoItemWidget> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              alignment: Alignment.center,
              content: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget._toDoItem.getDescription(),
                  textAlign: TextAlign.center,
                  style: TextStyleConstants.textStyleSmall,
                ),
              ),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.fromLTRB(10, 10, 50, 10),
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditItemScreen(
                                widget._toDoItem, widget._parentContext)));
                      }),
                  IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        widget._toDoItemsController
                            .removeItem(widget._toDoItem); // Delete the item.
                        const DeletedItemNotification().dispatch(
                            context); // Send notification to the parent widget.
                      }),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                      style: TextStyleConstants.textStyleSmall,
                      (widget._toDoItem.getDescription().length > 25)
                          ? "${widget._toDoItem.getDescription().substring(0, 25)}..."
                          : widget._toDoItem.getDescription()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
