import 'package:flutter/material.dart';
import 'package:mcq/models/subject.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.c,
  });

  final Subject c;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Color(0xFFE2E8F0), // Slate-200
          width: 1,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Color(0xFFF8FAFC), // Slate-50
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFFE2E8F0), // Slate-200
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.book_outlined,
                color: Color(0xFF0F172A), // Slate-900
                size: 24,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    c.subjectName,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E293B), // Slate-800
                      letterSpacing: -0.3,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Multiple Choice Questions',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF64748B), // Slate-500
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFFF8FAFC), // Slate-50
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.arrow_forward,
                color: Color(0xFF0F172A), // Slate-900
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
