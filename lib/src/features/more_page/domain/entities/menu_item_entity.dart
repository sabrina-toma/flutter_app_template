import 'package:flutter/material.dart';

class MenuItem {
  String title;
  List<Item> menus;

  MenuItem(this.title, this.menus);
}

class Item {
  final String title;
  final IconData icon;
  String? span;
  String routPath;
  final bool protected;

  Item({
    required this.title,
    required this.icon,
    required this.routPath,
    required this.protected,
    this.span,
  });
}