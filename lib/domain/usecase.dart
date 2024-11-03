//Usecases define the application's business rule. Each use case perform one specific task,
//Fetching all todos,adding a todos, or updating a todo.
import 'package:todo_bloc/domain/entity.dart';
import 'package:todo_bloc/domain/repository.dart';

class GetTodos {
  final ToDoRepository repository;
  GetTodos(this.repository);
  Future<List<ToDo>> call() {
    return repository.getTodos();
  }
}

class AddTodo {
  final ToDoRepository repository;
  AddTodo(this.repository);
  Future<void> call(ToDo todo) {
    return repository.addTodo(todo);
  }
}

class UpdateTodo {
  final ToDoRepository repository;
  UpdateTodo(this.repository);
  Future<void> call(ToDo todo) {
    return repository.updateTodo(todo);
  }
}

class DeleteTodo {
  final ToDoRepository repository;
  DeleteTodo(this.repository);
  Future<void> call(String id) {
    return repository.deleteTodo(id);
  }
}
// Each use case class accepts an instance of todorepository in its constructor. 
// this allows the usecase to call the repository method to perform dataa operation.