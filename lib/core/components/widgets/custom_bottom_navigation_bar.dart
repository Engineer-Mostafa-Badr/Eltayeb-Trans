import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItem> items;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? elevation;
  final BottomNavigationBarType type;
  final double? selectedFontSize;
  final double? unselectedFontSize;
  final IconThemeData? selectedIconTheme;
  final IconThemeData? unselectedIconTheme;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.elevation,
    this.type = BottomNavigationBarType.fixed,
    this.selectedFontSize,
    this.unselectedFontSize,
    this.selectedIconTheme,
    this.unselectedIconTheme,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: items,
      backgroundColor: backgroundColor,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      elevation: elevation,
      type: type,
      selectedFontSize: selectedFontSize ?? 14.0,
      unselectedFontSize: unselectedFontSize ?? 12.0,
      selectedIconTheme: selectedIconTheme,
      unselectedIconTheme: unselectedIconTheme,
    );
  }
}
