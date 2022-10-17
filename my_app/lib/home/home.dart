import 'package:flutter/material.dart';
import 'package:my_app/services/auth.dart';
import 'package:my_app/login/login.dart';
import 'package:my_app/topics/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Authentication().userStream,
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading');
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        } else {
          return LoginScreen();
        }
      }),
    );
  }
}
