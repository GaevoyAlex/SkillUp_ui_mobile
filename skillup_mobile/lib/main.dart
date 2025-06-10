import 'package:flutter/material.dart';
import 'package:skillup_mobile/presentation/Home/Screen/HomePageScreen.dart';
import 'package:skillup_mobile/presentation/Main/Screen/MainBottomNavigation.dart';

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

        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 60, 2, 158)),
      ),
      home: MainBottomNavigation(),
      // routes: {
      //   '/': (context) => Homepagescreen(),
      // },
    );
  }
}
