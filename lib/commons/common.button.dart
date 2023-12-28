import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_video_app/model/color.model.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.text, required this.onPressed});

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: Size(
            Get.width,
            45,
          ),
          backgroundColor: AppColors.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
