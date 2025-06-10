import 'package:flutter/material.dart';
import 'package:skillup_mobile/presentation/Home/Screen/HomePageScreen.dart';

import '../../../theme/colors.dart';



class MainBottomNavigation extends StatefulWidget {
  const MainBottomNavigation({super.key});

  @override
  State<MainBottomNavigation> createState() => _MainbottomNavigationState();
}

class _MainbottomNavigationState extends State<MainBottomNavigation> {
  int _selectedIndex = 0;

    static const List<Widget> _widgetOptions = <Widget>[
    Homepagescreen(),
    Homepagescreen(),
    Homepagescreen(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        unselectedItemColor: AppColors.unSelectedBtn,
        selectedItemColor: AppColors.buttonTextColor,
        backgroundColor: AppColors.background,
        onTap: (value) {
          setState(() => _selectedIndex = value );
        },

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,),
            label: 'Профиль',
          ),
        ],       
      ),
      
    );
  }
}