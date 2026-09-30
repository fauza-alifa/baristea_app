import 'package:baristea_app/screens/favorite_screen.dart';
import 'package:baristea_app/screens/home_screen.dart';
import 'package:baristea_app/theme/app_theme.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [HomeScreen(), FavoriteScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: SafeArea(
        
        child: Container(
          height: 68,
          decoration: BoxDecoration(            
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            color: Colors.white,
            buttonBackgroundColor: AppTheme.primary,
            height: 60,
            index: _selectedIndex,
            items: [
              CurvedNavigationBarItem(
                child: Icon(
                  Icons.home,
                  color: _selectedIndex == 0 ? Colors.white : AppTheme.primary,
                ),
              ),
              CurvedNavigationBarItem(
                child: Icon(
                  Icons.favorite,
                  color: _selectedIndex == 1 ? Colors.white : AppTheme.primary,
                ),
              ),
            ],
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
