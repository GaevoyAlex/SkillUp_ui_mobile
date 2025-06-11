import 'package:flutter/material.dart';

class LearnPageScreen extends StatefulWidget {
  const LearnPageScreen({super.key});

  @override
  State<LearnPageScreen> createState() => _LearnPageScreenState();
}

class _LearnPageScreenState extends State<LearnPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Learn page'),);
  }
}