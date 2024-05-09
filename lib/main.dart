import 'package:auditorium/screens/home.dart';
import 'package:auditorium/utils/app_scrollbehave.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      home: const MyHomePage(),
    );
  }
}
