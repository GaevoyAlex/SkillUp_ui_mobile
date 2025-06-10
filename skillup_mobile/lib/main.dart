import 'package:flutter/material.dart';
import 'package:skillup_mobile/presentation/Home/Screen/HomePageScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Homepagescreen(),
      // routes: {
      //   '/': (context) => Homepagescreen(),
      // },
    );
  }
}
