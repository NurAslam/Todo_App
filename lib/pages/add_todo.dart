import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerTitle = TextEditingController();
    TextEditingController controllerDesc = TextEditingController();
    AppBar myAppBar = AppBar(
      title: Text("Add Todo "),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );

    double heightBody = MediaQuery.of(context).size.height -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double widthBody = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_task_outlined),
        onPressed: () {
          setState(
            () {
              if (controllerTitle.text.length != 0 ||
                  controllerDesc.text.length != 0) {
                dataTodo.add(
                  Todo(
                      id: DateTime.now().toString(),
                      title: controllerTitle.text.length == 0 ? "No Title" : controllerTitle.text,
                      description: controllerDesc.text.length == 0 ? "No Deskripsi" : controllerDesc.text),
                );
              }
              print(dataTodo);
              Navigator.pop(context);
            },
          );
        },
      ),
      appBar: myAppBar,
      body: Container(
        padding: EdgeInsets.all(20),
        width: widthBody,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white10),
              child: TextField(
                controller: controllerTitle,
                maxLength: 20,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: heightBody * 0.02,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white10),
              child: TextField(
                controller: controllerDesc,
                maxLines: 10,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  hintText: "Description",
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
