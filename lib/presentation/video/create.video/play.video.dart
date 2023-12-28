// ignore_for_file: avoid_unnecessary_containers

import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:short_video_app/controllers/createvideo.controller.dart';
import 'package:short_video_app/model/color.model.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({super.key, required this.file});
  final File file;
  @override
  State<PlayVideo> createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  // video controller
  final videoController = Get.put(CreateVideoController());
  final audio = AudioPlayer();

  @override
  void initState() {
    super.initState();
    videoController.playVideo(widget.file);
    // audio.play(UrlSource(videoController.selected.value.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return InkWell(
            onTap: () {
              videoController.changeOpacity;
              setState(() {});
              if (videoController.chewieController.value.isPlaying) {
                videoController.chewieController.value.pause();
              } else {
                videoController.chewieController.value.play();
              }
            },
            child: Chewie(controller: videoController.chewieController.value));
      }),
      floatingActionButton: playPauseButton,
    );
  }

// play/pause button
  Widget get playPauseButton => Obx(() => AnimatedOpacity(
        opacity: videoController.opacity.value,
        duration: const Duration(seconds: 2),
        child: Center(
          child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (videoController.chewieController.value.isPlaying) {
                    videoController.chewieController.value.pause();
                  } else {
                    videoController.chewieController.value.play();
                  }
                });
              },
              backgroundColor: Colors.transparent,
              child: (videoController.chewieController.value.isPlaying)
                  ? Icon(
                      Feather.pause,
                      color: AppColors.white,
                    )
                  : Icon(
                      Feather.play,
                      color: AppColors.white,
                    )),
        ),
      ));
}
