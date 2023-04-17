import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_video_app/controllers/video.controller.dart';
import 'package:short_video_app/presentation/video/dashboard/show.video.dart';
import 'package:short_video_app/presentation/video/dashboard/video.tile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Importing controller
  final videoController = Get.put(VideoController());
  // Page controller
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (index) {},
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        // Video object
        final video = videoController.videos[index];
        return VideoTile(video: video);
      },
      itemCount: videoController.videos.length,
    );
  }
}
