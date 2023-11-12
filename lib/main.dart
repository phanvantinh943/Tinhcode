import 'package:figma_app/App/OnBoarding_01.dart';
import 'package:flutter/material.dart';

import 'App/SignIn.dart';
// import 'Model/post.dart';
// import 'network/network_request.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      home: const OnBoarding_01(),
      debugShowCheckedModeBanner: false,
    );
  }
}









