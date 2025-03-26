import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mcq/pages/WrongAnswer.dart';
import 'package:mcq/widget/optionCard.dart';
import 'dart:convert';
import 'dart:math';
import 'package:mcq/models/questionoption.dart';
class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  Stopwatch stopwatch=Stopwatch();
  Map data = {};
  List<Question> questions = [];
  int questionIndex = 0; // Start from 0
  bool isLoading = true; // Track loading state
  bool isOptionWrong=false;
  int minutesTaken=0;
  int secondsTaken=0;
  void change_isOptionWrongFlag(){
    setState(() {
      if (isOptionWrong){
        isOptionWrong=false;
        questions.removeAt(questionIndex);

      }
      else{
        isOptionWrong=true;
      }
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    stopwatch.start();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
    getData();
  }

  void getData() async {
    final response = await http.get(Uri.parse(
        '${dotenv.env['api']}/api/course/subject/${data['subject_id']}/questionoption/${data['number_of_question']}'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      List<Question> q = jsonData.map((q) => Question.fromJson(q)).toList();

      setState(() {
        questions = q;
        isLoading = false;
      });
    } else {
      print('Failed to load questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isOptionWrong) {
      return WrongAnswer(change_isOptionWrong: change_isOptionWrongFlag,question:questions[questionIndex]);
    } else {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Color(0xFF57637b)],
              )),
          child: SafeArea(
            child: isLoading
                ? Center(child: CircularProgressIndicator(color: Colors.white))
                : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Center(child: Text('NMC Prep',style:TextStyle(fontSize: 40,color: Colors.black))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Center(
                    child: Text(
                      questions.isNotEmpty
                          ? questions[questionIndex].questionText
                          : "Loading...",
                      style: TextStyle(fontSize: 20,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: questions.isNotEmpty &&
                        questions[questionIndex].options.isNotEmpty
                        ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: questions[questionIndex].options.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: GestureDetector(
                            onTap: () {
                              int insertIndex = 0;
                              if (questions.length > 2) {
                                insertIndex = 2 + Random().nextInt(2);
                              } else if (questions.length == 2) {
                                insertIndex = 2;
                              } else if (questions.length == 1) {
                                insertIndex = 1;
                              }
                              if (questionIndex < questions.length - 1) {
                                if (questions[questionIndex].options[index]
                                    .isCorrect == 1) {
                                  setState(() {
                                    questions.removeAt(questionIndex);
                                  });
                                } else {
                                  setState(() {
                                    questions.insert(
                                        insertIndex, questions[questionIndex]);
                                  });
                                  change_isOptionWrongFlag();
                                }
                              } else {
                                stopwatch.stop();
                                Navigator.pushNamed(context, '/subjects/ten_twenty/question/exitquestion',
                                arguments:{
                                  'minutes':stopwatch.elapsed.inMinutes,
                                  'seconds':stopwatch.elapsed.inSeconds%60,
                                  'subject_id': data['subject_id'],
                                  'subject_name':data['subject_name']
                                });
                              }
                            },
                            child: OptionCard(
                                text: questions[questionIndex].options[index]
                                    .optionText),
                          ),
                        );
                      },
                    )
                        : Center(child: Text("No options available")),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    }
  }
}

class Finished extends StatelessWidget {
  const Finished({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('HEalskdjflasjk'),
        centerTitle: true,
      ),
    );
  }
}
// /askdjfalskdhflakds
