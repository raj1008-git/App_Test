import '../models/todo_model.dart';

class TodoState {
  final List<Todo> todos;

  TodoState({required this.todos});

  factory TodoState.initial() => TodoState(todos: []);
}
