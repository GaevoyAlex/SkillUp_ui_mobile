import 'package:flutter/material.dart';
import 'package:skillup_mobile/theme/colors.dart';
import '../../Main/Widgets/main_widgets.dart';

class RoadmapScreen extends StatefulWidget {
  const RoadmapScreen({super.key});

  @override
  State<RoadmapScreen> createState() => _RoadmapScreenState();
}

class _RoadmapScreenState extends State<RoadmapScreen> {
  // Данные роадмапа
  final List<RoadmapStep> roadmapSteps = [
    RoadmapStep(
      title: 'Текущий уровень',
      description: 'Анализ ваших навыков и опыта',
      skills: ['Python', 'Flutter', 'SQL'],
      isCompleted: true,
      estimatedTime: 'Завершено',
      icon: Icons.person,
    ),
    RoadmapStep(
      title: 'Изучение React',
      description: 'Освоение фронтенд разработки',
      skills: ['React', 'JavaScript', 'HTML/CSS'],
      isCompleted: false,
      estimatedTime: '2-3 недели',
      icon: Icons.web,
    ),
    RoadmapStep(
      title: 'Backend разработка',
      description: 'Углубление в серверную разработку',
      skills: ['Node.js', 'Express', 'MongoDB'],
      isCompleted: false,
      estimatedTime: '3-4 недели',
      icon: Icons.storage,
    ),
    RoadmapStep(
      title: 'DevOps навыки',
      description: 'Изучение инфраструктуры и развертывания',
      skills: ['Docker', 'AWS', 'CI/CD'],
      isCompleted: false,
      estimatedTime: '4-5 недель',
      icon: Icons.cloud,
    ),
    RoadmapStep(
      title: 'Fullstack разработчик',
      description: 'Цель карьерного развития',
      skills: ['Архитектура', 'Лидерство', 'Менторство'],
      isCompleted: false,
      estimatedTime: '6+ месяцев',
      icon: Icons.emoji_events,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return mainScafoldWidget(
      'Персональный роадмап',
      SingleChildScrollView(
        child: Column(
          children: [
            // Заголовок и прогресс
            _buildHeader(),
            
            // Роадмап шаги
            ..._buildRoadmapSteps(),
            
            // Кнопки действий
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  // Заголовок с прогрессом
  Widget _buildHeader() {
    final completedSteps = roadmapSteps.where((step) => step.isCompleted).length;
    final totalSteps = roadmapSteps.length;
    final progress = completedSteps / totalSteps;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.cardVacancyColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.buttonTextColor.withOpacity(0.2),
          ),
        ),
        child: Column(
          children: [
            // Прогресс бар
            Row(
              children: [
                Text(
                  'Прогресс:',
                  style: TextStyle(
                    color: AppColors.textOnPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: AppColors.buttonTextColor.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.buttonTextColor,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '$completedSteps/$totalSteps',
                  style: TextStyle(
                    color: AppColors.textOnPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Описание
            Text(
              'Ваш персональный план развития карьеры создан на основе анализа навыков и целей. Следуйте шагам для достижения желаемой позиции.',
              style: TextStyle(
                color: AppColors.textOnPrimary.withOpacity(0.8),
                fontSize: 14,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Построение шагов роадмапа
  List<Widget> _buildRoadmapSteps() {
    return roadmapSteps.asMap().entries.map((entry) {
      final index = entry.key;
      final step = entry.value;
      final isLast = index == roadmapSteps.length - 1;
      
      return _buildRoadmapStepWidget(step, isLast);
    }).toList();
  }

  // Виджет шага роадмапа
  Widget _buildRoadmapStepWidget(RoadmapStep step, bool isLast) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Левая часть с иконкой и линией
          Column(
            children: [
              // Иконка шага
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: step.isCompleted 
                      ? AppColors.buttonTextColor 
                      : AppColors.cardVacancyColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.buttonTextColor,
                    width: 2,
                  ),
                ),
                child: Icon(
                  step.isCompleted ? Icons.check : step.icon,
                  color: step.isCompleted 
                      ? Colors.white 
                      : AppColors.buttonTextColor,
                  size: 24,
                ),
              ),
              
              // Вертикальная линия
              if (!isLast)
                Container(
                  width: 2,
                  height: 80,
                  color: AppColors.buttonTextColor.withOpacity(0.3),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                ),
            ],
          ),
          
          const SizedBox(width: 16),
          
          // Правая часть с контентом
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.cardVacancyColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: step.isCompleted 
                      ? AppColors.buttonTextColor.withOpacity(0.5)
                      : AppColors.buttonTextColor.withOpacity(0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Заголовок и время
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          step.title,
                          style: TextStyle(
                            color: AppColors.textOnPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: step.isCompleted 
                              ? AppColors.buttonTextColor.withOpacity(0.2)
                              : AppColors.buttonTextColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          step.estimatedTime,
                          style: TextStyle(
                            color: AppColors.textOnPrimary,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Описание
                  Text(
                    step.description,
                    style: TextStyle(
                      color: AppColors.textOnPrimary.withOpacity(0.8),
                      fontSize: 14,
                      height: 1.3,
                    ),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Навыки
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: step.skills.map((skill) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.buttonTextColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppColors.buttonTextColor.withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          skill,
                          style: TextStyle(
                            color: AppColors.textOnPrimary,
                            fontSize: 12,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  
                  // Кнопка действия для неактивных шагов
                  if (!step.isCompleted) ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _startStep(step),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonTextColor.withOpacity(0.1),
                          foregroundColor: AppColors.buttonTextColor,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Начать изучение',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Кнопки действий
  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Кнопка обновить роадмап
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _updateRoadmap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonTextColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.refresh, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Обновить роадмап',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Кнопка поделиться
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: _shareRoadmap,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.buttonTextColor,
                side: BorderSide(color: AppColors.buttonTextColor),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.share, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Поделиться роадмапом',
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

  // Методы действий
  void _startStep(RoadmapStep step) {
    // Показать диалог с ресурсами для изучения
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardVacancyColor,
        title: Text(
          'Начать изучение',
          style: TextStyle(color: AppColors.textOnPrimary),
        ),
        content: Text(
          'Для изучения "${step.title}" рекомендуем следующие ресурсы:\n\n'
          '• Онлайн курсы\n'
          '• Документация\n'
          '• Практические проекты\n'
          '• Ментoring сессии',
          style: TextStyle(color: AppColors.textOnPrimary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Закрыть',
              style: TextStyle(color: AppColors.buttonTextColor),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Здесь можно добавить переход к ресурсам
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonTextColor,
            ),
            child: const Text('Перейти к ресурсам'),
          ),
        ],
      ),
    );
  }

  void _updateRoadmap() {
    // Показать снэкбар с уведомлением
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Роадмап обновлен на основе новых навыков'),
        backgroundColor: AppColors.buttonTextColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _shareRoadmap() {
    // Показать диалог с опциями поделиться
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardVacancyColor,
        title: Text(
          'Поделиться роадмапом',
          style: TextStyle(color: AppColors.textOnPrimary),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('Скопировать ссылку'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Сохранить как изображение'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Отправить по email'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

// Модель данных для шага роадмапа
class RoadmapStep {
  final String title;
  final String description;
  final List<String> skills;
  final bool isCompleted;
  final String estimatedTime;
  final IconData icon;

  RoadmapStep({
    required this.title,
    required this.description,
    required this.skills,
    required this.isCompleted,
    required this.estimatedTime,
    required this.icon,
  });
}