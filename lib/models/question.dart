import 'package:dummy_example/models/answer.dart';

class Question {
  String question;
  List<Answer> answers;
  Answer correct_answer;

  Question(this.question, this.answers, this.correct_answer);
}
