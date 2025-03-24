import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/course.dart';
import '../widget/courseCard.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Course> courses = [];
  void getData() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: ".env");
    print("yo chai aafdai");

    final response = await http.get(Uri.parse('${dotenv.env['api']}/api/courses'));
    print('jaksdjhfakjsd');
    if (response.statusCode == 200) {
      print('aayo');
      print('good xa hai');
      List<dynamic> jsonData = json.decode(response.body);
      print(jsonData);
      setState(() {
        courses = jsonData.map((json) => Course.fromJson(json)).toList();
      });
    } else {
      print('gedaasdfasdfasdfasdfasdfasdfasdf\n\nasdfasdfa\n');
      print('Failed to load data: ${response.statusCode}');
    }
  }
  @override
  void initState() {
    super.initState();
    print('ini state');
    getData();
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
                      'Course Library',
                      style: TextStyle(
                        color: Color(0xFF1E293B), // Slate-800
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Access your study materials',
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
                  child: courses.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: courses.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/subjects',
                                    arguments: {
                                      'course_id': courses[index].courseId,
                                      'course_name': courses[index].courseName,
                                    },
                                  );
                                },
                                child: CourseCard(c: courses[index]),
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
