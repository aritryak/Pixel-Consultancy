import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_video_app/controllers/createvideo.controller.dart';

class VideoTrimmerTestScreen extends StatelessWidget {
  VideoTrimmerTestScreen({super.key});

  final controller = Get.put(CreateVideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Load"),
          onPressed: () {
            controller.pickedVideo;
          },
        ),
      ),
    );
  }
}
