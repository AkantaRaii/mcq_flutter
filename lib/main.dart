import 'package:flutter/material.dart';
import 'package:mcq/pages/QuestionPage.dart';
import 'pages/HomePage.dart';
import 'pages/SubjectPage.dart';
import 'pages/TenTwentyPage.dart';
import 'pages/ExitQuestionPage.dart';

void main() {
  runApp(MaterialApp(
    home:Home(),
    routes: {
      '/subjects':(context)=>SubjectPage(),
      '/subjects/ten_twenty':(context)=>TenTwenty(),
      '/subjects/ten_twenty/question':(context)=>QuestionPage(),
      '/subjects/ten_twenty/question/exitquestion':(context)=>ExitQuestion(),

    },
  ));



























































}





