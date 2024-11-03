//Todobloc will use the event and state to manage the business logic.
import 'package:bloc/bloc.dart';
import 'package:todo_bloc/domain/usecase.dart';
import 'package:todo_bloc/representation_layer/todo_event.dart';
import 'package:todo_bloc/representation_layer/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodos getTodosUseCase;
  final AddTodo addTodoUsecase;
  final DeleteTodo deleteTodoUseCase;
  TodoBloc(
      {required this.getTodosUseCase,
      required this.addTodoUsecase,
      required this.deleteTodoUseCase})
      : super(TodoInitial()) {
    //Bloc recieves and event(eg. <LoadTodos>) from ToDoEvent.
    //Bloc uses emit to update the state(eg. emit(todoLoadedState(data))).

    on<LoadTodos>((event, emit) async {
      emit(TodoLoading());
      try {
        final todos =
            await getTodosUseCase(); // Bloc calls getDataUseCase from usecasae.dart
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError('failed to load todos'));
      }
      // TODO: implement event handler
    });
    on<AddTodoEvent>((event, emit) async {
      try {
        await addTodoUsecase(event.todo);
//Dispatch loadTodos() to trigger another handler for loading todos.
        add(LoadTodos());
      } catch (e) {
        emit(TodoError('Failed to add todo'));
      }
    });
    on<DeleteTodoEvent>(
      (event, emit) async {
        try {
          await deleteTodoUseCase(event.id);
          add(LoadTodos());
        } catch (e) {
          emit(TodoError('Failed to delete todos'));
        }
      },
    );
  }
}
