// import 'package:mcq/models/option.dart';
// class Question {
//   final int questionId;
//   final String questionText;
//   List<Option> options; // No final here
//
//   Question({
//     required this.questionId,
//     required this.questionText,
//     List<Option>? options, // Make it optional
//   }) : options = options ?? []; // Initialize if null
//
//   factory Question.fromJson(Map<String, dynamic> json) {
//     return Question(
//       questionId: json['question_id'],
//       questionText: json['question_text'],
//     );
//   }
//   void append(Option op){
//     options.add(op);
//   }
// }
