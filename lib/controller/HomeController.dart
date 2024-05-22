import 'package:flutter/material.dart';

class HomeController {
  static HomeController instance = HomeController();

  final List<String> _widgetSelection = [
    "/agents",
    "/maps",
  ];
  var _selectedIndex = 0;

  Widget tabController(){
    return const Placeholder();
  }

  void setIndex(int index){
    _selectedIndex = index;
  }

  String getWidget(){
    return _widgetSelection[_selectedIndex];
  }

}