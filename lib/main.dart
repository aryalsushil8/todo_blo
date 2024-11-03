import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/domain/usecase.dart';
import 'package:todo_bloc/representation_layer/todo_state.dart';
import 'package:todo_bloc/representation_layer/todo_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(
          getTodosUseCase: GetTodos(repository),
          addTodoUsecase: AddTodo(repository),
          deleteTodoUseCase: DeleteTodo(repository)),
      child: const MaterialApp(
        home: Apps(),
      ),
    );
  }
}

class Apps extends StatelessWidget {
  const Apps({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return ListTile(
                  title: Text(todo.title),
                );
              },
            );
          } else if (state is TodoError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Center(
              child: Text('No Todos'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a new todo
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
