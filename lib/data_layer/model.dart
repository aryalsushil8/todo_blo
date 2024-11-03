//It represents how data is structured within the data layer. they also handle converting data between json and apps and internal data structures( domain entities)
//Data layer is responsible for data acess,which may involve interacting with local storage or APIs.
//It implements the repository interface define in the domain layer.
import 'package:todo_bloc/domain/entity.dart';

class TodoModel extends ToDo {
  TodoModel(
      {required super.id, required super.title, super.isCompleted = false});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        id: json['id'],
        title: json['title'],
        isCompleted: json['isCompleted'] ?? false);
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'isLoaded': isCompleted};
  }
}
