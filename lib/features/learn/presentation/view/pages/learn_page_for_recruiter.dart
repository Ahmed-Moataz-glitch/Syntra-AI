import 'package:flutter/material.dart';

class LearnPageForRecruiter extends StatelessWidget {
  const LearnPageForRecruiter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Learn Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      )
    );
  }
}