import 'package:flutter/material.dart';
import 'package:my_app/services/models.dart';
import 'package:my_app/shared/progress_bar.dart';
import 'package:my_app/topics/quizzes.dart';
// import 'package:my_app/topics/topics.dart';

class TopicEntry extends StatelessWidget {
  final Topic topic;
  const TopicEntry({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: topic.thumbnail,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => TopicScreen(topic: topic),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: SizedBox(
                  child: Image.asset(
                    'assets/thumbnails/${topic.thumbnail}',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Text(
                    topic.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
              ),
              Flexible(
                child: Progress(topic: topic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopicScreen extends StatelessWidget {
  final Topic topic;
  const TopicScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          topic.title,
          // textAlign: TextAlign.center,
          // style: const TextStyle(
          //     height: 2, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(children: [
        // Text(
        //   topic.title,
        //   textAlign: TextAlign.center,
        //   style: const TextStyle(
        //       height: 2, fontSize: 30, fontWeight: FontWeight.bold),
        // ),
        Hero(
          tag: topic.thumbnail,
          child: Image.asset('assets/thumbnails/${topic.thumbnail}',
              width: MediaQuery.of(context).size.width),
        ),
        QuizList(topic: topic)
      ]),
    );
  }
}
