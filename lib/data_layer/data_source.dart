//This is where actual data fetching happens.(eg. from local database or API).
//The tododatasource and its implmenttaion provides the actual mechanism for data fetching and manipulation.

import 'package:todo_bloc/domain/entity.dart';

abstract class TodoDataSource {
  Future<List<ToDo>> getTodos();
  Future<void> addTodo(ToDo todo);
  Future<void> deleteTodo(String id);
  Future<void> updateTodo(ToDo todo);
}

class TodoLocalDataSource implements TodoDataSource {
  List<ToDo> todos = [];

  @override
  Future<void> addTodo(ToDo todo) async {
    // TODO: implement addTodo
    todos.add(todo);
  }

  @override
  Future<void> deleteTodo(String id) async {
    // TODO: implement deleteTodo
    todos.removeWhere((test) => test.id == id);
  }

  @override
  Future<List<ToDo>> getTodos() async {
    // TODO: implement getTodos
    return todos;
  }

  @override
  Future<void> updateTodo(ToDo todo) async {
    final index = todos.indexWhere((test) => test.id == todo.id);
    if (index != -1) {
      todos[index] = todo;
    }
  }
}
