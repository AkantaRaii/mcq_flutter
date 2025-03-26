import 'package:flutter/material.dart';
import 'package:mcq/widget/TenTwentyCard.dart';

class TenTwenty extends StatefulWidget {
  const TenTwenty({super.key});

  @override
  State<TenTwenty> createState() => _TenTwentyState();
}

class _TenTwentyState extends State<TenTwenty> {
  Map data={};
  List<String> texts = ['10 Questions', '20 Questions', '30 Questions'];
  List numberOfQuestion=[10,20,100];
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    data = ModalRoute.of(context)?.settings.arguments as Map? ?? {};
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
                      'Question Pool',
                      style: TextStyle(
                        color: Color(0xFF1E293B), // Slate-800
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Choose question length, you will randomly get selected number of Questions',
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
                  child: texts.isEmpty
                      ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                      : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: texts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/subjects/ten_twenty/question',
                              arguments: {
                                'subject_id': data['subject_id'],
                                'subject_name': data['subject_name'],
                                  'number_of_question':numberOfQuestion[index],
                              },
                            );
                          },
                          child: TenTwentyCard(text: texts[index]),
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
