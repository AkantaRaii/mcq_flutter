class Subject {
  final int subjectId;
  final String subjectName;

  Subject({required this.subjectId, required this.subjectName});

  // Factory constructor for JSON deserialization
  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      subjectId: json['subject_id'],
      subjectName: json['subject_name'],
    );
  }

  // Convert Subject object to JSON
  Map<String, dynamic> toJson() {
    return {
      'subject_id': subjectId,
      'subject_name': subjectName,
    };
  }
}
