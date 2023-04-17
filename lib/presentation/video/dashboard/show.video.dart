import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_video_app/controllers/video.controller.dart';

class ShowVideo extends StatefulWidget {
  const ShowVideo({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<ShowVideo> createState() => _ShowVideoState();
}

class _ShowVideoState extends State<ShowVideo> {
  final videoController = Get.put(VideoController());

  // @override
  // void dispose() {
  //   super.dispose();
  //   videoController.dispose();
  // }

  @override
  void initState() {
    super.initState();
    videoController.initializeControllers(url: widget.videoUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // if (videoController
      //     .chewieController.value.videoPlayerController.value.isInitialized) {
      return Transform.scale(
        scaleX: 1.15,
        child: Chewie(
          controller: videoController.chewieController.value,
        ),
      );
      // } else {
      //   return Text(videoController.videoPlayerController.value.toString());
      //   // Container(
      //   //     color: AppColors.neumorphicColor,
      //   //     child: CommonWidgets.circularLoader);
      // }
    });
  }
}
