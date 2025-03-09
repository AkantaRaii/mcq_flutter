class Option {
  final int optionId;
  final String optionText;
  final int isCorrect;

  Option({required this.optionId,required this.optionText,required this.isCorrect});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      optionId: json['option_id'],
      optionText: json['option_text'],
      isCorrect: json['is_correct']
    );
  }
}