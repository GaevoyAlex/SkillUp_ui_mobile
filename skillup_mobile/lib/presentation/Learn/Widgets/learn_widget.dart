

import 'package:flutter/material.dart';

import '../../../theme/colors.dart' show AppColors;

Widget stackContainerWidget (title,widget,) {
  return Padding(
    padding: EdgeInsets.all(14),
    child:  Container(
      padding: EdgeInsets.all(14),
      width: double.infinity,
      margin: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: AppColors.cardVacancyColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,  
        children: [
          Text(title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.textOnPrimary
          ),),
          SizedBox(height: 10,),
          widget
        ],
      ) ,
    )
  );
}


