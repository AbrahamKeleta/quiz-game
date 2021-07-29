import 'package:dummy_example/models/question.dart';
import 'package:dummy_example/seed/question_seed.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Question> _qs = QuestionSeed().giveQuestions();
  @override
  Widget build(BuildContext context) {
    // TODO: implement  build
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _qs.length,
            itemBuilder: (context, index) {
              return QuestionWidget(_qs[index]);
            },
          )
        ],
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  Question _q;
  QuestionWidget(this._q);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Text("${_q.question}"),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _q.answers.length,
          itemBuilder: (context, index) {
            return Center(
              child: Text(
                "${_q.answers[index].value}",
                style: TextStyle(
                  fontSize: 10,
                  color: (_q.correct_answer == _q.answers[index])
                      ? Colors.blue
                      : Colors.orange,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
