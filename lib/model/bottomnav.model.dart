import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class BottomNavModel {
  String? title;
  IconData? icon;
  BottomNavModel({this.icon, this.title});
}

List<BottomNavModel> bottomNavItems = [
  BottomNavModel(title: "", icon: Feather.command),
  BottomNavModel(title: "", icon: Feather.search),
  BottomNavModel(title: "", icon: Feather.plus),
  BottomNavModel(title: '', icon: Feather.film),
  BottomNavModel(title: "", icon: Feather.user)
];
