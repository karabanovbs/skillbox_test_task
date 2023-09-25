import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:skillbox_test_task/models/todo.dart';
import 'package:skillbox_test_task/models/user.dart';

class ApiClient {
  final http.Client client;

  ApiClient(this.client);

  Future<List<User>> getUsers() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/'));

    final List<Object?> json = jsonDecode(response.body);

    final result = json.map((e) => User.fromJson(e as Map<String, Object?>));

    return result.toList();
  }

  Future<List<Todo>> getTodos() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/'));

    final List<Object?> json = jsonDecode(response.body);

    final result = json.map((e) => Todo.fromJson(e as Map<String, Object?>));

    return result.toList();
  }
}
