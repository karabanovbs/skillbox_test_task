import 'package:skillbox_test_task/bloc/users_bloc/uses_event.dart';
import 'package:skillbox_test_task/models/user.dart';

class SelectUser extends UsesEvent {
  final User user;

  const SelectUser(this.user);
}
