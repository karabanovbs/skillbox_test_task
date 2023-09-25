import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skillbox_test_task/models/user.dart';

part 'users_state.freezed.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState({
    List<User>? users,
    @Default({})
    Set<int> selectedUser,
  }) = _UsersState;
}
