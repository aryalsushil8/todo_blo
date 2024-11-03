//In this layer, we define the core data structure(entity) i.e. used throughout the app.
class ToDo {
  final String id;
  final String title;
  final bool isCompleted;

  ToDo({required this.id, required this.title, required this.isCompleted});
}
