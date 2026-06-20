import 'package:flutter/material.dart';

class CommunityPageForLearnerAndTeam extends StatelessWidget {
  const CommunityPageForLearnerAndTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Community Page',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      )
    );
  }
}