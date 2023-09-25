import 'package:flutter/material.dart';
import 'package:skillbox_test_task/screens/chat.dart';
import 'package:skillbox_test_task/screens/home_tabs/todos_home_tab.dart';
import 'package:skillbox_test_task/screens/home_tabs/users_home_tab.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Chat(),
                  ));
                },
                icon: const Icon(Icons.shopping_cart))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(child: Text('Users')),
              Tab(child: Text('Todos')),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            UsersHomeTab(),
            TodosHomeTab(),
          ],
        ),
      ),
    );
  }
}
