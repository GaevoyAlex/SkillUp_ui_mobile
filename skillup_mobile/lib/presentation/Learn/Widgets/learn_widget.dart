

import 'package:flutter/material.dart';

import '../../../theme/colors.dart' show AppColors;

Widget learnContainerWidget (widget) {
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
      child: widget,
    )
  );
}