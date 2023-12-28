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
  // video controller
  final videoController = Get.put(VideoController());


  @override
  void initState() {
    super.initState();
    videoController.initializeControllers(url: widget.videoUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
    
      return Transform.scale(
        scaleX: 1.15,
        child: Chewie(
          controller: videoController.chewieController.value,
        ),
      );
     
    });
  }
}
