import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skillbox_test_task/models/todo.dart';

part 'todos_state.freezed.dart';

@freezed
class TodosState with _$TodosState {
  const factory TodosState({
    List<Todo>? todos,
  }) = _TodosState;
}
