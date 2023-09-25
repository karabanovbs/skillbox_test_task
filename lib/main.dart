import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:skillbox_test_task/bloc/todos_bloc/events/load_todos.dart';
import 'package:skillbox_test_task/bloc/todos_bloc/todos_bloc.dart';
import 'package:skillbox_test_task/bloc/users_bloc/events/load_users.dart';
import 'package:skillbox_test_task/bloc/users_bloc/users_bloc.dart';
import 'package:skillbox_test_task/screens/home.dart';
import 'package:skillbox_test_task/services/api_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => ApiClient(Client()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UsersBloc(context.read<ApiClient>())
              ..add(
                const LoadUsers(),
              ),
          ),
          BlocProvider(
            create: (context) => TodosBloc(context.read<ApiClient>())
              ..add(
                const LoadTodos(),
              ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const Home(),
        ),
      ),
    );
  }
}
