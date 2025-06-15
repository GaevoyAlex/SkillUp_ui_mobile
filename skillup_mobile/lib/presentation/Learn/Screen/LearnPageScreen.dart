import 'package:flutter/material.dart';
import 'package:skillup_mobile/presentation/Learn/Screen/RoadMapScreen.dart';
import 'package:skillup_mobile/presentation/Learn/Widgets/learn_widget.dart';
import 'package:skillup_mobile/theme/colors.dart';

import '../../Main/Widgets/main_widgets.dart';

class LearnPageScreen extends StatefulWidget {
  const LearnPageScreen({super.key});

  @override
  State<LearnPageScreen> createState() => _LearnPageScreenState();
}

class _LearnPageScreenState extends State<LearnPageScreen> {
  // Список навыков
  List<String> skills = [
    'Python',
    'Flutter',
    'Dart',
    'JavaScript',
    'React',
    'Node.js',
    'SQL',
    'Git'
  ];

  // Контроллер для добавления нового навыка
  final TextEditingController _skillController = TextEditingController();

  @override
  void dispose() {
    _skillController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return mainScafoldWidget(
      'Analytics data',
      SingleChildScrollView(
        child: Column(
          children: [
            // Виджет навыков
            _buildSkillsSection(),
            
            // Кнопка анализа
            _buildAnalyzeButton(),
            
            // Графики зарплат
            _buildSalaryChartsSection(),
            
            // Роадмап секция
            _buildRoadmapSection(),
          ],
        ),
      ),
    );
  }

  // Секция с навыками
  Widget _buildSkillsSection() {
    return stackContainerWidget(
      'Навыки',
      Column(
        children: [
          // Отображение навыков в столбцах
          _buildSkillsGrid(),
          
          const SizedBox(height: 16),
          
          // Поле для добавления нового навыка
          _buildAddSkillField(),
        ],
      ),
    );
  }

  // Сетка навыков в 3 колонки
  Widget _buildSkillsGrid() {
    // Разбиваем навыки на 3 колонки
    List<List<String>> columns = [[], [], []];
    for (int i = 0; i < skills.length; i++) {
      columns[i % 3].add(skills[i]);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Первая колонка
        Expanded(child: _buildSkillColumn(columns[0])),
        
        // Вторая колонка
        Expanded(child: _buildSkillColumn(columns[1])),
        
        // Третья колонка
        Expanded(child: _buildSkillColumn(columns[2])),
      ],
    );
  }

  // Колонка навыков
  Widget _buildSkillColumn(List<String> columnSkills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: columnSkills.map((skill) => _buildSkillItem(skill)).toList(),
    );
  }

  // Элемент навыка с возможностью удаления
  Widget _buildSkillItem(String skill) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.cardVacancyColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.buttonTextColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Иконка навыка
          Icon(
            Icons.circle,
            size: 12,
            color: AppColors.buttonTextColor,
          ),
          
          const SizedBox(width: 8),
          
          // Название навыка
          Flexible(
            child: Text(
              skill,
              style: TextStyle(
                color: AppColors.textOnPrimary,
                fontSize: 14,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          
          const SizedBox(width: 4),
          
          // Кнопка удаления
          GestureDetector(
            onTap: () => _removeSkill(skill),
            child: Icon(
              Icons.close,
              size: 16,
              color: AppColors.textOnPrimary.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  // Поле для добавления нового навыка
  Widget _buildAddSkillField() {
    return Row(
      children: [
        // Поле ввода
        Expanded(
          child: TextField(
            controller: _skillController,
            style: TextStyle(color: AppColors.textOnPrimary),
            decoration: InputDecoration(
              hintText: 'Добавить навык...',
              hintStyle: TextStyle(
                color: AppColors.textOnPrimary.withOpacity(0.6),
              ),
              filled: true,
              fillColor: AppColors.cardVacancyColor.withOpacity(0.3),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.buttonTextColor.withOpacity(0.3),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.buttonTextColor.withOpacity(0.3),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: AppColors.buttonTextColor,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            onSubmitted: (value) => _addSkill(value),
          ),
        ),
        
        const SizedBox(width: 12),
        
        // Кнопка добавления
        ElevatedButton(
          onPressed: () => _addSkill(_skillController.text),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonTextColor,
            foregroundColor: AppColors.textOnPrimary,
            padding: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

  // Кнопка анализа
  Widget _buildAnalyzeButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: null, // Неактивная кнопка
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonTextColor.withOpacity(0.3),
            foregroundColor: AppColors.textOnPrimary,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Индикатор загрузки
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.textOnPrimary.withOpacity(0.7),
                  ),
                ),
              ),
              
              const SizedBox(width: 12),
              
              // Текст кнопки
              Text(
                'Анализируем навыки...',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textOnPrimary.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Секция с графиками зарплат
  Widget _buildSalaryChartsSection() {
    return stackContainerWidget(
      'Корреляция зарплат по регионам',
      Column(
        children: [
          // График 1: Средние зарплаты по регионам
          _buildSalaryChart(
            'Средние зарплаты по регионам',
            _buildRegionalSalaryChart(),
          ),
          
          const SizedBox(height: 20),
          
          // График 2: Динамика роста зарплат
          _buildSalaryChart(
            'Динамика роста за год',
            _buildSalaryTrendChart(),
          ),
          
          const SizedBox(height: 20),
          
          // График 3: Распределение по навыкам
          _buildSalaryChart(
            'Зарплаты по навыкам',
            _buildSkillsSalaryChart(),
          ),
        ],
      ),
    );
  }

  // Контейнер для графика
  Widget _buildSalaryChart(String title, Widget chart) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardVacancyColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.buttonTextColor.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.textOnPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          chart,
        ],
      ),
    );
  }

  // Заглушка: График зарплат по регионам
  Widget _buildRegionalSalaryChart() {
    final regions = ['Москва', 'СПб', 'Казань', 'Екатеринбург', 'Новосибирск'];
    final salaries = [180000, 140000, 90000, 95000, 85000];

    return Column(
      children: regions.asMap().entries.map((entry) {
        int index = entry.key;
        String region = entry.value;
        int salary = salaries[index];
        double percentage = salary / salaries.first;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              // Название региона
              SizedBox(
                width: 80,
                child: Text(
                  region,
                  style: TextStyle(
                    color: AppColors.textOnPrimary,
                    fontSize: 12,
                  ),
                ),
              ),
              
              // Полоса прогресса
              Expanded(
                child: LinearProgressIndicator(
                  value: percentage,
                  backgroundColor: AppColors.buttonTextColor.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.buttonTextColor,
                  ),
                ),
              ),
              
              const SizedBox(width: 8),
              
              // Зарплата
              Text(
                '${salary ~/ 1000}к',
                style: TextStyle(
                  color: AppColors.textOnPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Заглушка: График динамики роста
  Widget _buildSalaryTrendChart() {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(6, (index) {
          double height = 20 + (index * 15.0);
          return Container(
            width: 20,
            height: height,
            decoration: BoxDecoration(
              color: AppColors.buttonTextColor,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        }),
      ),
    );
  }

  // Заглушка: График зарплат по навыкам
  Widget _buildSkillsSalaryChart() {
    final topSkills = skills.take(5).toList();
    
    return Column(
      children: topSkills.asMap().entries.map((entry) {
        int index = entry.key;
        String skill = entry.value;
        double percentage = (5 - index) / 5;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              // Навык
              SizedBox(
                width: 80,
                child: Text(
                  skill,
                  style: TextStyle(
                    color: AppColors.textOnPrimary,
                    fontSize: 12,
                  ),
                ),
              ),
              
              // Полоса
              Expanded(
                child: LinearProgressIndicator(
                  value: percentage,
                  backgroundColor: AppColors.buttonTextColor.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.buttonTextColor,
                  ),
                ),
              ),
              
              const SizedBox(width: 8),
              
              // Процент
              Text(
                '+${(percentage * 30).toInt()}%',
                style: TextStyle(
                  color: AppColors.textOnPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Секция роадмапа
  Widget _buildRoadmapSection() {
    return stackContainerWidget(
      'Персональный роадмап',
      Column(
        children: [
          // Описание
          Text(
            'Создайте персональный план развития карьеры на основе ваших навыков и целей',
            style: TextStyle(
              color: AppColors.textOnPrimary.withOpacity(0.8),
              fontSize: 14,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 20),
          
          // Иллюстрация роадмапа
          _buildRoadmapIllustration(),
          
          const SizedBox(height: 20),
          
          // Кнопка построения роадмапа
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _navigateToRoadmap(),
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

  // Иллюстрация роадмапа
  Widget _buildRoadmapIllustration() {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardVacancyColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.buttonTextColor.withOpacity(0.2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Этап 1
          _buildRoadmapStep(
            icon: Icons.person,
            title: 'Текущий\nуровень',
            isActive: true,
          ),
          
          // Стрелка
          Icon(
            Icons.arrow_forward,
            color: AppColors.buttonTextColor,
            size: 20,
          ),
          
          // Этап 2
          _buildRoadmapStep(
            icon: Icons.trending_up,
            title: 'Развитие\nнавыков',
            isActive: false,
          ),
          
          // Стрелка
          Icon(
            Icons.arrow_forward,
            color: AppColors.buttonTextColor,
            size: 20,
          ),
          
          // Этап 3
          _buildRoadmapStep(
            icon: Icons.emoji_events,
            title: 'Цель\nкарьеры',
            isActive: false,
          ),
        ],
      ),
    );
  }

  // Этап роадмапа
  Widget _buildRoadmapStep({
    required IconData icon,
    required String title,
    required bool isActive,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Иконка в кружке
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isActive 
                ? AppColors.buttonTextColor 
                : AppColors.buttonTextColor.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        
        const SizedBox(height: 8),
        
        // Название этапа
        Text(
          title,
          style: TextStyle(
            color: isActive 
                ? AppColors.textOnPrimary 
                : AppColors.textOnPrimary.withOpacity(0.6),
            fontSize: 10,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Переход на страницу роадмапа
  void _navigateToRoadmap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RoadmapScreen(),
      ),
    );
  }

  // Методы для работы с навыками
  void _addSkill(String skill) {
    final trimmedSkill = skill.trim();
    if (trimmedSkill.isNotEmpty && !skills.contains(trimmedSkill)) {
      setState(() {
        skills.add(trimmedSkill);
      });
      _skillController.clear();
    }
  }

  void _removeSkill(String skill) {
    setState(() {
      skills.remove(skill);
    });
  }
}