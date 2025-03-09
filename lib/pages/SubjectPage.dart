import 'package:flutter/material.dart';
import 'package:mcq/models/subject.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mcq/widget/subjectCard.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({super.key});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  Map data={};
  int courseId=0; // Declare a variable to store course_id
  List<Subject> subjects=[];
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    data = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
    // Extract course_id from the passed arguments
    courseId = data['course_id'] ?? 0;
    // Now make the API call if courseId is available
    if (courseId != 0) {
      getData();
    }
  }

  void getData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/api/course/$courseId/subjects/'));

    if (response.statusCode == 200) {
      // Parse the response and update UI with course name or any other data
      setState(() {
        List<dynamic> jsonData = json.decode(response.body);
          subjects = jsonData.map((json) => Subject.fromJson(json)).toList();
      });
    } else {
      // Handle errors, like if API call fails
      setState(() {
      });
      print('Failed to load course data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFFFFF), // Pure white
              Color(0xFF57637b), // Very light blue-gray
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data['course_name']} Subjects',
                      style: TextStyle(
                        color: Color(0xFF1E293B), // Slate-800
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Choose subjects to study',
                      style: TextStyle(
                        color: Color(0xFF64748B), // Slate-500
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: subjects.isEmpty
                      ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                      : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: subjects.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/subjects/ten_twenty',
                              arguments: {
                                'subject_id': subjects[index].subjectId,
                                'subject_name': subjects[index].subjectName,
                              },
                            );
                          },
                          child: SubjectCard(c: subjects[index]),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

