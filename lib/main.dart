import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_video_app/model/color.model.dart';
import 'package:short_video_app/model/font.model.dart';

import 'presentation/bottomnav/bottom.nav.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,  
      theme: ThemeData(
        primaryColor: AppColors.primary,
        fontFamily: Fonts.regular,
        scaffoldBackgroundColor: AppColors.white
      ),
      home:  BottomNavBarScreen(),
    );
  }
}


