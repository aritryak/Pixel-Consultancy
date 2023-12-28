// ignore_for_file: unnecessary_overrides, unnecessary_null_comparison

// import 'dart:io';

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:short_video_app/presentation/video/create.video/play.video.dart';
import 'package:video_player/video_player.dart';
import 'package:video_trimmer/video_trimmer.dart';

class CreateVideoController extends GetxController {
  // camera controller
  CameraController? cameraController;

  // List of cameras
  late List<CameraDescription> cameras;

  // video controller
  Rx<VideoPlayerController> videoPlayerController =
      VideoPlayerController.asset("").obs;
  // chewie controller
  Rx<ChewieController> chewieController =
      ChewieController(videoPlayerController: VideoPlayerController.asset(""))
          .obs;

  //video picker
  final ImagePicker picker = ImagePicker();
  late File pickedVideo;

  // video recording percent
  RxDouble videoRecordPercent = 0.0.obs;

  // periodic timer for start and stop recording
  Timer? periodicTimer;

  RxString selected = "".obs;

  // Opacity value
  RxDouble opacity = 1.0.obs;

  // function to change the opacity
  void get changeOpacity {
    if (opacity.value == 1) {
      opacity.value = 0;
    } else {
      opacity.value = 1;
    }
  }

  @override
  void onInit() {
    super.onInit();
    initializeCamera;
  }

  // function to initialized the camera controller
  void get initializeCamera async {
    // list of available camera
    cameras = await availableCameras();
    // initialized camera controller
    cameraController = CameraController(cameras[0], ResolutionPreset.max);
    if (cameraController != null) {
      await cameraController!.initialize();
      update();
    }
  }

// flip camera button for front and rear
  void get toggleCamera async {
    if (cameraController!.description.lensDirection.index == 1) {
      cameraController = CameraController(cameras[1], ResolutionPreset.max);
      await cameraController!.initialize();
      update();
    } else {
      initializeCamera;
    }
  }

// pick video from gallery
  void get pickVideos async {
    XFile? video = await picker.pickVideo(
        source: ImageSource.gallery, maxDuration: const Duration(seconds: 30));

    if (video != null) {
      pickedVideo = File(video.path);
      Get.to(PlayVideo(
        file: pickedVideo,
      ));

      log(video.path);
    }
  }

  Trimmer trimmer = Trimmer();
  final startValue = 0.0.obs;
  final endValue = 0.0.obs;

  final isPlaying = false.obs;
  final progress = false.obs;
  /* load video */
  get loadVideo {
    trimmer.loadVideo(videoFile: pickedVideo);
  }



// play video picked from gallery
  void playVideo(file) async {
    videoPlayerController.value = VideoPlayerController.file(file);
    chewieController.value = ChewieController(
      videoPlayerController: videoPlayerController.value,
      autoInitialize: true,
      autoPlay: true,
      showControls: false,
      aspectRatio: Get.size.aspectRatio,
      looping: true,
    );
    await videoPlayerController.value.initialize();
    await chewieController.value.play();
  }

  // function for start recording
  void get startRecording async {
    // Write start video recording function
    if (!cameraController!.value.isRecordingVideo) {
      await cameraController!.startVideoRecording();
      startTimer;
    } else {
      // Stopping video recording
      stopVideoRecording;
    }
  }

  // Function to stop video recording
  void get stopVideoRecording async {
    XFile? recordedVideo = await cameraController!.stopVideoRecording();
    if (recordedVideo != null) {
      pickedVideo = File(recordedVideo.path);
      stopTimer(pickedVideo: pickedVideo);
    }
  }

  // Function to start timer
  void get startTimer {
    // Starting counter - changing video percent
    periodicTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick > 30) {
        // When the timer reach 30 secs - disposing the periodic timer
        timer.cancel();
        // Navigating to the ahow video screen
        stopVideoRecording;
      } else {
        // This function calls this internal function for every secs
        changeVideoRecordingCounter;
      }
    });
  }

  // Function to stop timer
  void stopTimer({pickedVideo}) {
    if (periodicTimer != null) {
      periodicTimer!.cancel();
    }
    Get.to(PlayVideo(file: pickedVideo));
  }

  // Change video recording counter
  void get changeVideoRecordingCounter {
    videoRecordPercent.value += 1 / 30;
  }


  /* add music to background */
  void get addMusicToBackground {

  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.value.dispose();
    chewieController.value.dispose();
  }
}
