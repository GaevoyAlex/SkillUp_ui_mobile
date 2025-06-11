import 'package:flutter/material.dart';
import 'package:skillup_mobile/theme/colors.dart';

Widget mainScafoldWidget (
  String appBarText,
  Widget widgetBody
){
  return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        foregroundColor:AppColors.background,
        leading: Icon(Icons.accessibility_sharp,color: AppColors.textOnPrimary,),
        title: Text( appBarText,
        style: TextStyle(
          color: AppColors.textOnPrimary,
          fontWeight: FontWeight.bold),
        ),
        centerTitle: true,

      ),
      body:SingleChildScrollView(child: widgetBody) 
    );

}