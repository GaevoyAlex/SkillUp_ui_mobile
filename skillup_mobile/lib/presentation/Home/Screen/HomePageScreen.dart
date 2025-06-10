import 'package:flutter/material.dart';
import 'package:skillup_mobile/presentation/Home/Widgets/vacancys_card_widget.dart';
import 'package:skillup_mobile/theme/colors.dart';

class Homepagescreen extends StatefulWidget {
  const Homepagescreen({super.key});

  @override
  State<Homepagescreen> createState() => _HomepagescreenState();
}

class _HomepagescreenState extends State<Homepagescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor:AppColors.background,
        leading: Icon(Icons.accessibility_sharp,color: AppColors.textOnPrimary,),
        title: Text("Career Hub",
        style: TextStyle(
          color: AppColors.textOnPrimary,
          fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

      ),
      body:SingleChildScrollView(child: Column(
        children: [
          cardVacancy(),
          cardVacancy(),
          cardVacancy(),
        ],
      ),) 
    );
  }
}