import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool varSementara = true;
  List<Todo> todos = dataTodo;
  @override
  Widget build(BuildContext context) {
    AppBar myAppBar = AppBar(
      title: Text("Todo App"),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );

    double heightBody = MediaQuery.of(context).size.height -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double widthBody = MediaQuery.of(context).size.width;

    // function search
    void searchTodo(String query) {
      final TodoFilter = dataTodo.where((todo) {
        final todoTitle = todo.title.toLowerCase();
        final input = query.toLowerCase();
        return todoTitle.contains(input);
      }).toList();
      setState(() {
        todos = TodoFilter;
      });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "add_todo");
        },
        child: Icon(Icons.add),
      ),
      appBar: myAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: widthBody,
              height: heightBody * 0.1,
              padding: EdgeInsets.all(20),
              child: TextField(
                onChanged: searchTodo,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search your task"),
              ),
            ),
            todos.length != 0
                ? Container(
                    height: heightBody * 0.8,
                    width: widthBody,
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: ((context, index) {
                        final todo = todos[index];
                        return CheckboxListTile(
                          value: todo.isComplete,
                          onChanged: (value) {
                            setState(
                              () {
                                todo.isComplete = value!;
                              },
                            );
                          },
                          secondary: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                todos.removeAt(index);
                              });
                            },
                          ),
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Text(
                            todo.title,
                            style: TextStyle(
                                fontSize: 18,
                                decoration: todo.isComplete
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none),
                          ),
                          subtitle: Text(todo.description),
                        );
                      }),
                    ),
                  )
                : Container(
                    child: Text("data kosong"),
                  ),
          ],
        ),
      ),
    );
  }
}
