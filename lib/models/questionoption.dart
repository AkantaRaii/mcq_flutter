class Question {
  final int questionId;
  final String questionText;
  final List<Option> options;

  Question({
    required this.questionId,
    required this.questionText,
    required this.options,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionId: json['question_id'],
      questionText: json['question_text'],
      options: (json['options'] as List).map((opt) => Option.fromJson(opt)).toList(),
    );
  }
}

class Option {
  final int questionId;
  final int optionId;
  final String optionText;
  final int isCorrect;

  Option({
    required this.questionId,
    required this.optionId,
    required this.optionText,
    required this.isCorrect,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      questionId: json['question_id'],
      optionId: json['option_id'],
      optionText: json['option_text'],
      isCorrect: json['is_correct'],
    );
  }
}
