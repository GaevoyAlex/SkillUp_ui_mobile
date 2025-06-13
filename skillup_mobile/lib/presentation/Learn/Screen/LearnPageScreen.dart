import 'package:flutter/material.dart';
import 'package:skillup_mobile/presentation/Learn/Widgets/learn_widget.dart';
import 'package:skillup_mobile/theme/colors.dart';

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
           stackContainerWidget(
            'Навыки',
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,  
              mainAxisSize: MainAxisSize.min, 
              children: [
                for (var i = 0; i < 10; i++)
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Icon(Icons.circle,
                      size: 20,
                      color: AppColors.buttonTextColor,),
                      SizedBox(width: 10,),
                      Text("Python",
                      style: TextStyle(
                        color: AppColors.textOnPrimary
                      ),)
                    ],
                  ),
                )  
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,  
              mainAxisSize: MainAxisSize.min, 
              children: [
                for (var i = 0; i < 10; i++)
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Icon(Icons.circle,
                      size: 20,
                      color: AppColors.buttonTextColor,),
                      SizedBox(width: 10,),
                      Text("Python",
                      style: TextStyle(
                        color: AppColors.textOnPrimary
                      ),)
                    ],
                  ),
                ) 
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,  
              mainAxisSize: MainAxisSize.min, 
              children: [
                for (var i = 0; i < 10; i++)
                Container(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Icon(Icons.circle,
                      size: 20,
                      color: AppColors.buttonTextColor,),
                      SizedBox(width: 10,),
                      Text("Python",
                      style: TextStyle(
                        color: AppColors.textOnPrimary
                      ),)
                    ],
                  ),
                ) 
              ],
            ),
            ],)
           ),
            //TODO кнопка показа анализа резюме
          stackContainerWidget(
            'Рейтинг зарплат',
            Column(
              children: [
                Text('data'),
              ],
            )
           )
        ],
      ),
    );
  }
}