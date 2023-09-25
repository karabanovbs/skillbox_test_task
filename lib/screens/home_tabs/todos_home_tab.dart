import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillbox_test_task/bloc/todos_bloc/todos_bloc.dart';
import 'package:skillbox_test_task/bloc/todos_bloc/todos_state.dart';

class TodosHomeTab extends StatelessWidget {
  const TodosHomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
          final users = state.todos;

          if (users == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            key: const PageStorageKey('todos'),
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(users[index].title),
                tileColor: users[index].completed ? Colors.green : null,
              );
            },
          );
        },
      ),
    );
  }
}
