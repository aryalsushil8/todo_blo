//Repository implementaion
//The repository connects the domain layer and implements the repository interface using the data resources.
// I'm creating class(TodoRepoImpl) that implements the TodoDataSouce(abstract class in data_source.dart).

import 'package:todo_bloc/data_layer/data_source.dart';
import 'package:todo_bloc/domain/entity.dart';

class TodoRepoImpl implements TodoDataSource {
  final TodoDataSource todoDataSource;
  TodoRepoImpl(this.todoDataSource);

  @override
  Future<void> addTodo(ToDo todo) {
    final model =
        ToDo(id: todo.id, title: todo.title, isCompleted: todo.isCompleted);
    return todoDataSource.addTodo(model);
    // TODO: implement addTodo
  }

  @override
  Future<void> deleteTodo(String id) async {
    return todoDataSource.deleteTodo(id);
    // TODO: implement deleteTodo
  }

  @override
  Future<List<ToDo>> getTodos() async {
    final models = await todoDataSource.getTodos();
    return models.map((model) => model).toList();
    // TODO: implement getTodos
  }

  @override
  Future<void> updateTodo(ToDo todo) async {
    final model =
        ToDo(id: todo.id, title: todo.title, isCompleted: todo.isCompleted);
    return todoDataSource.updateTodo(model);
    // TODO: implement updateTodo
  }
}
//This todorepoimpl class serves as the concrete implementaation of the todorepository interface,
//acting as a bridge between the domain layer and the data source layer.
//This todorepoimpl.class directly interacts with whatever implementation of tododatasource you provide.(api's or loccal storage)
