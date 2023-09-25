import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbox_test_task/bloc/users_bloc/users_bloc.dart';
import 'package:skillbox_test_task/bloc/users_bloc/users_state.dart';
import 'package:skillbox_test_task/ui/user_avatar.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selected users')),
      body: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          final users = state.users
              ?.where((element) => state.selectedUser.contains(element.id))
              .toList();

          if (users == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: UserAvatar(name: users[index].name),
                title: Text(users[index].name),
                subtitle: Text(users[index].email),
              );
            },
          );
        },
      ),
    );
  }
}
