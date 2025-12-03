import 'package:flutter/material.dart';
import 'package:syntra_ai/core/view/pages/onboarding_page.dart';
import 'package:syntra_ai/features/auth/presentation/view/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syntra.Ai',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
