import 'package:flutter/material.dart';
import 'package:skillup_mobile/presentation/Learn/Widgets/learn_widget.dart';

import '../../Main/Widgets/main_widgets.dart';

class LearnPageScreen extends StatefulWidget {
  const LearnPageScreen({super.key});

  @override
  State<LearnPageScreen> createState() => _LearnPageScreenState();
}

class _LearnPageScreenState extends State<LearnPageScreen> {
  @override
  Widget build(BuildContext context) {
    return mainScafoldWidget(
      //AppBar title
      'Analytics data',
      //Body
      Column(
        children: [
           learnContainerWidget(
            Column(
              children: [
                Text('data')
              ],
            ),
           )
        ],
      ),
    );
  }
}