import 'package:flutter/material.dart';
import 'package:ultra_notes/login.dart';
import 'package:ultra_notes/main_page.dart';
import 'package:ultra_notes/sign_up.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UltraNotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: Login(),
      );
  }
}