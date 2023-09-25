import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbox_test_task/bloc/users_bloc/events/load_users.dart';
import 'package:skillbox_test_task/bloc/users_bloc/events/select_user.dart';
import 'package:skillbox_test_task/bloc/users_bloc/users_state.dart';
import 'package:skillbox_test_task/bloc/users_bloc/uses_event.dart';
import 'package:skillbox_test_task/services/api_client.dart';

class UsersBloc extends Bloc<UsesEvent, UsersState> {
  final ApiClient client;

  UsersBloc(this.client) : super(const UsersState()) {
    on<LoadUsers>(_onLoadUsers);
    on<SelectUser>(_onSelectUser);
  }

  FutureOr<void> _onLoadUsers(LoadUsers event, Emitter<UsersState> emit) async {
    emit(state.copyWith(users: await client.getUsers()));
  }

  FutureOr<void> _onSelectUser(SelectUser event, Emitter<UsersState> emit) {
    emit(state.copyWith(
        selectedUser: state.selectedUser.contains(
      event.user.id,
    )
            ? {
                ...state.selectedUser
                    .where((element) => element != event.user.id)
              }
            : {
                ...state.selectedUser,
                event.user.id,
              }));
  }
}
