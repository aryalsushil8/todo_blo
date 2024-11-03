//This layer uses the usecases from the domain layer.
import 'package:equatable/equatable.dart';
import 'package:todo_bloc/domain/entity.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object> get props => [];
}

class LoadTodos extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final ToDo todo;
  AddTodoEvent(this.todo);
  @override
  // TODO: implement props
  List<Object> get props => [todo];
}

class UpdateTodoEvent extends TodoEvent {
  final ToDo toDo;
  UpdateTodoEvent(this.toDo);
  @override
  List<Object> get props => [toDo];
}

class DeleteTodoEvent extends TodoEvent {
  final String id;
  DeleteTodoEvent(this.id);
  @override
  // TODO: implement props
  List<Object> get props => [id];
}
