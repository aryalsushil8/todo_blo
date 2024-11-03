//Define the possible states for the apps state management:

import 'package:equatable/equatable.dart';
import 'package:todo_bloc/domain/entity.dart';

class TodoState extends Equatable {
  const TodoState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<ToDo> todos;
  TodoLoaded(this.todos);
  @override
  List<Object> get props => [];
}

class TodoError extends TodoState {
  final String message;
  TodoError(this.message);
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
