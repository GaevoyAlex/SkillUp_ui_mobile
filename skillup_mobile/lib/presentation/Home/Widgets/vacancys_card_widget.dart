
import 'package:flutter/material.dart';
import 'package:skillup_mobile/theme/colors.dart';


Widget cardVacancy(
  // String vacancyName,
  // String companyName,
  // String cityName,
  // List skillStack
) {
  return Padding(
    padding: EdgeInsets.all(14),
    child: Card(
      color: AppColors.cardVacancyColor,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,  
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),),  
      child: Container(
        width: double.infinity,  
        padding: EdgeInsets.all(16),  
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  
          mainAxisSize: MainAxisSize.min, 
          children: [
            Text(
              'Название вакансии',
              style: TextStyle(
                color: AppColors.textOnPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Название компании',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w100,
                color: AppColors.textOnPrimary,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Город',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: AppColors.textOnPrimary,
              ),
            ),
            SizedBox(height: 12),
            
            SizedBox(height: 8),
            Wrap(
              alignment: WrapAlignment.start, 
              spacing: 5,
              runSpacing: 5,
              children: [
                Padding(padding: EdgeInsets.only(top: 5),
                child: Text(
              "Основные навыки:",
               style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w100,
                color: AppColors.textSecondary,
              ),)
                
            ),
                chipStack('Python'),
                chipStack('torch'),
                chipStack('Управление командой'),
                chipStack('Docker'),
                
              ],
            ),
            SizedBox(height: 15,),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  // Переход на вакансию
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.textOnPrimary, 
                  backgroundColor: AppColors.buttonBackGrndColor, 
                  side: BorderSide(color: AppColors.buttonTextColor, width: 1), 
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12), 
                  shape: RoundedRectangleBorder(  
                    borderRadius: BorderRadius.circular(20)),
                  textStyle: TextStyle(fontSize: 16,),  
                ),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children:[ Text('Просмотреть')]),
              )
            )
          ],
        ),
      ),
    )
  );
}


Widget chipStack(String str){
  return Padding(
    padding: EdgeInsets.only(left: 5,bottom: 5),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 159, 159, 159),
        ),
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(31, 205, 205, 205)
      ),
      child: Padding(padding: EdgeInsets.all(5),
        child: Text(str,
              style: TextStyle(
                color: const Color.fromARGB(176, 255, 255, 255),
              )
            ,)
          ,) 
      ),
  );
}