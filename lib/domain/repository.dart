//The repository interface defines the contract that the data layer will implement.
// It abstracts data fetching so the domain layer doesnt need to worry about where data comes from(local storage, remote Api).
//It enssurs that the domain logic is decoupled from how the data is actually retrived or stored.
import 'package:todo_bloc/domain/entity.dart';

abstract class ToDoRepository {
  Future<List<ToDo>> getTodos();
  Future<void> addTodo(ToDo todo);
  Future<void> updateTodo(ToDo todo);
  Future<void> deleteTodo(String id);
}
//This todorepository interface defines a contract for how data operations related to ToDo items should be handeld.
//The bloc will later use this repository interface to interact with data without needing to know the data source. 