import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:short_video_app/model/color.model.dart';
import 'package:short_video_app/model/video.model.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  final List<Video> videos = [];

  @override
  void onInit() {
    super.onInit();
    videos.addAll(availableVideos);
    initializeControllers(url: "https://assets.mixkit.co/videos/preview/mixkit-man-under-multicolored-lights-1237-large.mp4");
  }

  // Initializing video player controller
  VideoPlayerController? videoPlayerController;
  // Initializing chewie controller
  ChewieController? chewieController;

  // Function to initialize two video controllers
  void initializeControllers({required String url}) async {
    videoPlayerController = VideoPlayerController.network(url);

    // await Future.wait([videoPlayerController!.initialize()]);
    await videoPlayerController!.initialize();

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoInitialize: true,
        autoPlay: true,
        showControls: false,
        aspectRatio: Get.size.aspectRatio,
        looping: true,
        );

    update();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController!.dispose();
    chewieController!.dispose();
  }

  @override
  void onClose() {
    videoPlayerController!.dispose();
    chewieController!.dispose();
  }
}
