class GenerateQuizResponseEntity {
  String quizTitle;
  List<QuestionsEntity> questions;

  GenerateQuizResponseEntity(
      {required this.quizTitle, required this.questions});
}

class QuestionsEntity {
  int id;
  String type;
  String questionText;
  List<String> options;
  String selectedAnswer = '';
  String correctAnswer;
  String explanation;

  QuestionsEntity(
      {required this.id,
      required this.type,
      required this.questionText,
      required this.options,
      required this.correctAnswer,
      required this.explanation});
}
