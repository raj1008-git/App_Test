import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_learn_cubit/cubit/todo_state.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_model.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState.initial());

  void addTodo(String title) {
    final newTodo = Todo(id: const Uuid().v4(), title: title);
    emit(TodoState(todos: [...state.todos, newTodo]));
  }

  void deleteTodo(String id) {
    emit(TodoState(todos: state.todos.where((t) => t.id != id).toList()));
  }

  void toggleTodo(String id) {
    final updated = state.todos.map((t) {
      if (t.id == id) {
        return t.copyWith(isDone: !t.isDone);
      }
      return t;
    }).toList();
    emit(TodoState(todos: updated));
  }
}
