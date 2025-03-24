import 'package:flutter/material.dart';

class ExitQuestion extends StatelessWidget {
  const ExitQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final minutes = arguments['minutes'];
    final seconds = arguments['seconds'];
    final subject_id=arguments['subject_id'];
    final subject_name=arguments['subject_name'];
    print('${minutes} min and ${seconds}');
    return Scaffold(
      body:GestureDetector(
        onTap: (){
          Navigator.pushNamed(
            context,
            '/subjects/ten_twenty',
            arguments: {
              'subject_id': subject_id,
              'subject_name': subject_name,
            },
          );
          print("continume");
        },
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Color(0xFF57637b)],
              )),
          child:SafeArea(child:
          Column(
            crossAxisAlignment:CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              CircleAvatar(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.check,size: 190,color: Colors.greenAccent,),

                  Text('${minutes}:${seconds}',style: TextStyle(fontSize: 80,color: Colors.grey[700]),)
                ],
              ),backgroundColor: Colors.grey[200],maxRadius: 180,minRadius: 40,),
              SizedBox(height: 100,),
              Center(child: Text('Tap to continue',style: TextStyle(fontSize: 18),),)
            ]
          ))
        ),
      ),

      );
  }
}
//SafeArea(child: Text('It took you${minutes} minutes and ${seconds} seconds to complete',style:TextStyle(fontSize: 18),)),