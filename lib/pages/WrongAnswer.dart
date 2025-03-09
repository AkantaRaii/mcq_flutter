import 'package:flutter/material.dart';
import 'package:mcq/models/question.dart';
import 'package:mcq/models/option.dart';
class WrongAnswer extends StatelessWidget {
  final VoidCallback change_isOptionWrong;
  final Question question;

  const WrongAnswer({super.key, required this.change_isOptionWrong,required this.question});
  @override
  Widget build(BuildContext context) {
    final Option correctOption = question.options.firstWhere((option) => option.isCorrect == 1);
    return  Scaffold(
      body: Container(
        decoration:BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Color(0xFF57637b)],
            )),
        child:SafeArea(child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(24),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Center(child: Text('Quiz App')),
              ),
            ),
            Container(
              margin:EdgeInsets.symmetric(vertical: 5,horizontal: 30),
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))
,              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                      padding:EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      decoration: BoxDecoration(
                        color:Colors.red[100],

                        borderRadius: BorderRadius.vertical(top:Radius.circular(8)
                        ),
                      ),
                      child:Center(child: Column(
                        children: [
                          Text("Incorrect",style: TextStyle(color:Colors.red[600],fontSize: 18,fontWeight: FontWeight.bold,),),
                          Text("You'll see this question again soon",style: TextStyle(color:Colors.red),),
                        ],
                      ),)
                  ),
                  Container(
                    padding:EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                      child: Text(question.questionText,style: TextStyle(fontSize: 20, letterSpacing: 1.3, fontWeight: FontWeight.bold),
                      )
                  ),
                  Divider(height: 10,),
                  Container(
                      padding:EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                      decoration: BoxDecoration(
                        // color:Colors.greenAccent[100]
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.check,color: Colors.green,),
                          SizedBox(width:10),
                          Text(correctOption.optionText,style: TextStyle(color:Colors.green,fontSize: 18, letterSpacing: 1.3,),
                          ),
                        ],
                      )
                  ),
                  GestureDetector(
                    onTap: (){
                      change_isOptionWrong();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical:15),
                      decoration:BoxDecoration(
                        color:Colors.grey[300],
                        borderRadius: BorderRadius.vertical(bottom:Radius.circular(8)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Next Question',style: TextStyle(fontSize: 18,letterSpacing: 1.3),),
                          Icon(Icons.arrow_forward_ios_outlined)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),)
      ),
    );
  }
}
