import 'package:dummy_example/models/answer.dart';
import 'package:dummy_example/models/question.dart';
import 'package:dummy_example/seed/answer_seed.dart';
import "dart:math";

class QuestionSeed {
  List<String> questions = ["a", "b", "c", "d"];
  final _random = new Random();
  AnswerSeed answerSeed = AnswerSeed();
  List<Question> giveQuestions() {
    List<Question> results = [];
    List<Answer> potentialAnswers = answerSeed.giveAnswers();
    questions.forEach((value) {
      Question _an = Question(value, potentialAnswers,
          potentialAnswers[_random.nextInt(potentialAnswers.length)]);
      results.add(_an);
    });
    return results;
  }
}
