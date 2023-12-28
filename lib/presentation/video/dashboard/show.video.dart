import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:short_video_app/controllers/video.controller.dart';

import '../../../commons/common.widgets.dart';
import '../../../model/color.model.dart';

class ShowVideo extends StatefulWidget {
  const ShowVideo({super.key, required this.videoUrl});
  final String videoUrl;

  @override
  State<ShowVideo> createState() => _ShowVideoState();
}

class _ShowVideoState extends State<ShowVideo> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoController>(
      init: VideoController(),
      builder: (videoController) {
        if (videoController.chewieController != null &&
            videoController
                .chewieController!.videoPlayerController.value.isInitialized) {
          return Transform.scale(
            scaleX: 1.15,
            child: Chewie(
              controller: videoController.chewieController!,
            ),
          );
        } else {
          return Container(
              color: AppColors.neumorphicColor,
              child: CommonWidgets.circularLoader);
        }
      },
    );
  }
}
