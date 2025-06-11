import 'package:flutter/material.dart';
import 'package:skillup_mobile/presentation/Home/Widgets/vacancys_card_widget.dart';
import 'package:skillup_mobile/presentation/Main/Widgets/main_widgets.dart';
import 'package:skillup_mobile/theme/colors.dart';

class Homepagescreen extends StatefulWidget {
  const Homepagescreen({super.key});

  @override
  State<Homepagescreen> createState() => _HomepagescreenState();
}

class _HomepagescreenState extends State<Homepagescreen> {
  @override
  Widget build(BuildContext context) {
    return mainScafoldWidget(
      //AppBar title
      'Career Hub',
      //Body
      Column(
        children: [
          cardVacancy(),
          cardVacancy(),
          cardVacancy(),
        ],
      ),
    );
  }
}


