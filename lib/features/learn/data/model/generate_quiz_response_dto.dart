import 'package:syntra_ai/features/learn/domain/entities/generate_quiz_response_entity.dart';

class GenerateQuizResponseDto {
  String? quizTitle;
  List<Questions>? questions;

  GenerateQuizResponseDto({this.quizTitle, this.questions});

  GenerateQuizResponseDto.fromJson(Map<String, dynamic> json) {
    quizTitle = json['quiz_title'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  GenerateQuizResponseEntity toEntity() {
    return GenerateQuizResponseEntity(
      quizTitle: quizTitle ?? '',
      questions: questions?.map((q) => q.toEntity()).toList() ?? [],
    );
  }
}

class Questions {
  int? id;
  String? type;
  String? questionText;
  List<String>? options;
  String? correctAnswer;
  String? explanation;

  Questions(
      {this.id,
      this.type,
      this.questionText,
      this.options,
      this.correctAnswer,
      this.explanation});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    questionText = json['question_text'];
    options = json['options'].cast<String>();
    correctAnswer = json['correct_answer'];
    explanation = json['explanation'];
  }

  QuestionsEntity toEntity() {
    return QuestionsEntity(
      id: id ?? 0,
      type: type ?? '',
      questionText: questionText ?? '',
      options: options ?? [],
      correctAnswer: correctAnswer ?? '',
      explanation: explanation ?? '',
    );
  }
}
