import 'package:flutter/material.dart';

import '../../Main/Widgets/main_widgets.dart';

class ProfileScreenPage extends StatefulWidget {
  const ProfileScreenPage({super.key});

  @override
  State<ProfileScreenPage> createState() => _ProfileScreenPageState();
}

class _ProfileScreenPageState extends State<ProfileScreenPage> {
  @override
  Widget build(BuildContext context) {
    return mainScafoldWidget(
      //AppBar title
      'Profile',
      //Body
      Column(
        children: [

        ],
      ),
    );
  }
}