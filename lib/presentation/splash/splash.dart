// ignore_for_file: avoid_unnecessary_containers

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_video_app/controller/auth.controller.dart';
import 'package:short_video_app/model/customers.model.dart';
import 'package:short_video_app/presentation/auth/login.dart';
import 'package:short_video_app/presentation/bottomnav/bottom.nav.screen.dart';
import 'package:short_video_app/services/cookies.services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      checkRoute;
    });
  }

  void get checkRoute async {
    final customer = await CookieService.getCookie(key: "customer");
    if (customer != null) {
      final parsedcustomer = jsonDecode(customer);
      authController.customer.value = CustomerModel.fromJson(parsedcustomer);
      Get.to(() => BottomNavBarScreen());
    } else {
      Get.to(() => Login());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      bgimage,
      Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/splashscreen/logo.png'),
                width: 500,
              ),
              Image(
                image: AssetImage('assets/splashscreen/text.png'),
                height: 150,
                width: 180,
              ),
            ],
          ),
        ),
      )
    ]);
  }

// background image
  Widget get bgimage =>
      const Image(image: AssetImage('assets/splashscreen/background.png'));
}
