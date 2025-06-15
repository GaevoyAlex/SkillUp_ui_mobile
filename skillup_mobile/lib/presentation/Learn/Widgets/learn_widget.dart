import 'package:flutter/material.dart';

import '../../../theme/colors.dart' show AppColors;

// Основной контейнер для секций
Widget stackContainerWidget(title, widget) {
  return Padding(
    padding: const EdgeInsets.all(14),
    child: Container(
      padding: const EdgeInsets.all(14),
      width: double.infinity,
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: AppColors.cardVacancyColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Заголовок секции  
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.textOnPrimary,
            ),
          ),
          const SizedBox(height: 10),
          // Содержимое секции
          widget
        ],
      ),
    ),
  );
}

// Виджет для отображения навыка (можно использовать отдельно)
Widget skillChipWidget(String skillName, {VoidCallback? onDelete}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    margin: const EdgeInsets.only(right: 8, bottom: 8),
    decoration: BoxDecoration(
      color: AppColors.buttonTextColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: AppColors.buttonTextColor.withOpacity(0.3),
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          skillName,
          style: TextStyle(
            color: AppColors.textOnPrimary,
            fontSize: 14,
          ),
        ),
        if (onDelete != null) ...[
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onDelete,
            child: Icon(
              Icons.close,
              size: 16,
              color: AppColors.textOnPrimary.withOpacity(0.7),
            ),
          ),
        ],
      ],
    ),
  );
}

// Виджет для статистики (используется в графиках)
Widget statisticBarWidget({
  required String label,
  required String value,
  required double percentage,
  Color? barColor,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        // Лейбл
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: TextStyle(
              color: AppColors.textOnPrimary,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        
        const SizedBox(width: 12),
        
        // Полоса прогресса
        Expanded(
          child: LinearProgressIndicator(
            value: percentage,
            backgroundColor: AppColors.buttonTextColor.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(
              barColor ?? AppColors.buttonTextColor,
            ),
          ),
        ),
        
        const SizedBox(width: 12),
        
        // Значение
        Text(
          value,
          style: TextStyle(
            color: AppColors.textOnPrimary,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

// Виджет пустого состояния (когда нет навыков)
Widget emptyStateWidget({
  required String title,
  required String description,
  IconData? icon,
}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 48,
              color: AppColors.textOnPrimary.withOpacity(0.4),
            ),
            const SizedBox(height: 16),
          ],
          Text(
            title,
            style: TextStyle(
              color: AppColors.textOnPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(
              color: AppColors.textOnPrimary.withOpacity(0.7),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

// Виджет для промо-секции роадмапа
Widget roadmapPromoWidget({
  required String title,
  required String description,
  required VoidCallback onPressed,
}) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          AppColors.buttonTextColor.withOpacity(0.1),
          AppColors.buttonTextColor.withOpacity(0.05),
        ],
      ),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: AppColors.buttonTextColor.withOpacity(0.3),
      ),
    ),
    child: Column(
      children: [
        // Иконка роадмапа
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.buttonTextColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.route,
            color: AppColors.buttonTextColor,
            size: 30,
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Заголовок
        Text(
          title,
          style: TextStyle(
            color: AppColors.textOnPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        
        const SizedBox(height: 8),
        
        // Описание
        Text(
          description,
          style: TextStyle(
            color: AppColors.textOnPrimary.withOpacity(0.8),
            fontSize: 14,
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
        
        const SizedBox(height: 20),
        
        // Кнопка
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonTextColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.route, size: 20),
                const SizedBox(width: 8),
                const Text(
                  'Построить роадмап',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}