import 'package:flutter/material.dart';
import 'screens/signup_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Beautiful Signup screen',
      debugShowCheckedModeBanner: false,
      home: SignupScreen(),
    );
  }
}