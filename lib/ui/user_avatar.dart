import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String name;

  const UserAvatar({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: Text(
        name.split(' ').map((e) => e[0].toUpperCase()).join(),
      ),
    );
  }
}
