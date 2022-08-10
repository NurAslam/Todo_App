class Todo {
  final String id;
  final String title;
  final String description;
  bool isComplete;

  Todo(
      {required this.id,
      required this.title,
      required this.description,
      this.isComplete = false});
}

List<Todo> dataTodo = [
  Todo(
      id: DateTime.now().toString(),
      title: "Mengerjakan Tugas",
      description: "Tugas Kuliah"),
  Todo(
      id: DateTime.now().toString(),
      title: "Memasak",
      description: "Memasak Ikan")
];
