import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:short_video_app/model/video.model.dart';
import 'package:video_player/video_player.dart';
import 'package:video_trimmer/video_trimmer.dart';

class VideoController extends GetxController {
  final List<Video> videos = [];

  @override
  void onInit() {
    super.onInit();
    videos.addAll(availableVideos);
  }

  // Initializing video player controller
  Rx<VideoPlayerController> videoPlayerController =
      VideoPlayerController.asset("").obs;
  // Initializing chewie controller
  Rx<ChewieController> chewieController =
      ChewieController(videoPlayerController: VideoPlayerController.asset(""))
          .obs;

  // Function to initialize two video controllers
  void initializeControllers({required String url}) async {
    videoPlayerController.value = VideoPlayerController.network(url);

    chewieController.value = ChewieController(
        videoPlayerController: videoPlayerController.value,
        autoInitialize: true,
        autoPlay: true,
        showControls: false,
        aspectRatio: Get.size.aspectRatio,
        looping: true);

    await videoPlayerController.value.initialize();
    await chewieController.value.play();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.value.dispose();
    chewieController.value.dispose();
  }

  /* trim video */
  // void get trimVideo {
    


  // }
}
