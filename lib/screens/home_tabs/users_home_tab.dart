import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbox_test_task/bloc/users_bloc/events/select_user.dart';
import 'package:skillbox_test_task/bloc/users_bloc/users_bloc.dart';
import 'package:skillbox_test_task/bloc/users_bloc/users_state.dart';
import 'package:skillbox_test_task/ui/user_avatar.dart';

class UsersHomeTab extends StatelessWidget {
  const UsersHomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        final users = state.users;

        if (users == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          key: const PageStorageKey('users'),
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: UserAvatar(name: users[index].name),
              title: Text(users[index].name),
              subtitle: Text(users[index].email),
              onTap: () {
                context.read<UsersBloc>().add(SelectUser(users[index]));
              },
              tileColor: state.selectedUser.contains(users[index].id)
                  ? Colors.blue
                  : null,
            );
          },
        );
      },
    );
  }
}
