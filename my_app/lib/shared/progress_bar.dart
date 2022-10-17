import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/services/services.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  final double height;
  const ProgressBar({super.key, required this.value, required this.height});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints box) {
        return Container(
          padding: const EdgeInsets.all(20),
          width: box.maxWidth,
          child: Stack(
            children: [
              Container(
                height: height,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(height),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutCubic,
                height: height,
                width: box.maxWidth * floor(value),
                decoration: BoxDecoration(
                  color: colorShifter(value),
                  borderRadius: BorderRadius.all(
                    Radius.circular(height),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Round negative or NaNs to min value
floor(double value, [min = 0.0]) {
  return value.sign <= min ? min : value;
}

/// Gradually change the color based on value
colorShifter(double value) {
  int rbg = (value * 255).toInt();
  return Colors.deepOrange.withGreen(rbg).withRed(255 - rbg);
}

class Progress extends StatelessWidget {
  const Progress({super.key, required this.topic});

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);
    return Row(
      children: [
        progressCount(report, topic),
        Expanded(
          child:
              ProgressBar(value: calculateProgress(topic, report), height: 16),
        ),
      ],
    );
  }

  Widget progressCount(Report report, Topic topic) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        '${report.topics[topic.id]?.length ?? 0} / ${topic.quizzes.length}',
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
    );
  }

  double calculateProgress(Topic topic, Report report) {
    try {
      int totalQuizzes = topic.quizzes.length;
      int completedQuizzes = report.topics[topic.id].length;
      return completedQuizzes / totalQuizzes;
    } catch (err) {
      return 0.0;
    }
  }
}
