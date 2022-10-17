import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/services/services.dart';
import 'package:my_app/shared/shared.dart';
import 'package:my_app/topics/topic.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirestoreService().getTopics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            List<Topic> topics = snapshot.data as List<Topic>;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: const Text('Topics'),
              ),
              body: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20.0),
                crossAxisSpacing: 10.0,
                crossAxisCount: 1,
                children:
                    topics.map((topic) => TopicEntry(topic: topic)).toList(),
              ),
              bottomNavigationBar: const BottomNavBar(),
            );
          } else {
            return const Text('There ar no topics at the moment...');
          }
        });
  }
}
