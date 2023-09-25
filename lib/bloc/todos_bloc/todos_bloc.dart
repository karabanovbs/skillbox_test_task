import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbox_test_task/bloc/todos_bloc/events/load_todos.dart';
import 'package:skillbox_test_task/bloc/todos_bloc/todos_event.dart';
import 'package:skillbox_test_task/bloc/todos_bloc/todos_state.dart';
import 'package:skillbox_test_task/services/api_client.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final ApiClient client;

  TodosBloc(this.client) : super(const TodosState()) {
    on<LoadTodos>(_onLoadTodos);
  }

  FutureOr<void> _onLoadTodos(LoadTodos event, Emitter<TodosState> emit) async {
    emit(state.copyWith(todos: await client.getTodos()));
  }
}
