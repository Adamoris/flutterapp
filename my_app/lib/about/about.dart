import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.blue,
      ),
      body: const Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Text(
            'Hello! Thanks for checking out my app.\n\n-Andrew Park',
            style: TextStyle(fontSize: 26),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
