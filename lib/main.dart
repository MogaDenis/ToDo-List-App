import 'package:flutter/material.dart';
import 'package:todo_list_app/controller/controller.dart';
import 'package:todo_list_app/model/todo_item.dart';
import 'package:todo_list_app/notifications/notifications.dart';
import 'package:todo_list_app/repository/repository.dart';
import 'package:todo_list_app/repository/todo_items_repository.dart';
import 'package:todo_list_app/widgets/todoItemWidget/todo_item_widget.dart';

void main() {
  runApp(const ToDoListApp());
}

class ToDoListApp extends StatelessWidget {
  const ToDoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(title: 'ToDo List App'),
    );
  }
}

class HomePage extends StatefulWidget {
  late final Repository<ToDoItem> _itemsRepository;
  late final Controller _controller;

  HomePage({super.key, required this.title}) {
    _itemsRepository = ToDoItemsRepository();
    _controller = Controller(_itemsRepository);
  }

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  late IconData _navigateIconData;

  _HomePageState() {
    _navigateIconData = Icons.arrow_downward;

    _scrollController.addListener(() {
      if (_scrollController.offset == 0) {
        setState(() {
          _navigateIconData = Icons.arrow_downward;
        });
      } else if (_navigateIconData == Icons.arrow_downward) {
        setState(() {
          _navigateIconData = Icons.arrow_upward;
        });
      }
    });
  }

  void _scrollDown() {
    if (_scrollController.hasClients) {
      final position = _scrollController.position.maxScrollExtent;
      _scrollController.animateTo(
        position,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
      );
    }
  }

  void _scrollUp() {
    if (_scrollController.hasClients) {
      final position = _scrollController.position.minScrollExtent;
      _scrollController.animateTo(
        position,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            child: Tooltip(
              message: "Add new note",
              child: ElevatedButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    widget._controller.addItem(ToDoItem(
                        "dummy${ToDoItem.idCounter} uasfkjasbfkjabsfkjabsfkjabsfjkabskfjabsfjasbfjkasbf"));
                  });
                },
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: NotificationListener<CustomNotification>(
            onNotification: (_) {
              setState(() {});
              return true;
            },
            child: ListView.builder(
                controller: _scrollController,
                key: const PageStorageKey<String>('page'),
                itemCount: widget._controller.getItems().length,
                itemBuilder: (context, index) {
                  return ToDoItemWidget(
                      widget._controller.getItemAtIndex(index),
                      widget._controller,
                      context);
                }),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          setState(() {
            if (_scrollController.offset == 0) {
              _scrollDown();
            } else {
              _scrollUp();
            }
          });
        },
        tooltip: 'Scroll to bottom',
        child: Icon(_navigateIconData),
      ),
    );
  }
}
