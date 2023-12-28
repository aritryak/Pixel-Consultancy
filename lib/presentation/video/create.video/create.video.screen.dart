// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:async';

import 'package:camera/camera.dart';
// import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:short_video_app/commons/common.widgets.dart';
import 'package:short_video_app/controllers/createvideo.controller.dart';
import 'package:short_video_app/model/color.model.dart';
import 'package:short_video_app/presentation/bottomnav/bottom.nav.screen.dart';
import 'package:short_video_app/presentation/video/create.video/add.music.dart';
import 'package:short_video_app/presentation/video/dashboard/dashboard.dart';

class CreateVideoScreen extends StatefulWidget {
  const CreateVideoScreen({super.key});

  @override
  State<CreateVideoScreen> createState() => _CreateVideoScreenState();
}

class _CreateVideoScreenState extends State<CreateVideoScreen> {
  final controller = Get.put(CreateVideoController());
  // Check progress of recording
  bool isProgress = false;
  // process indicator percent

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: GetBuilder<CreateVideoController>(
          init: CreateVideoController(),
          dispose: (state) {
            if (state.controller != null) {
              state.controller!.cameraController!.dispose();
            }
          },
          builder: (controller) {
            if (controller.cameraController == null ||
                !controller.cameraController!.value.isInitialized) {
              return const CircularProgressIndicator();
            } else {
              return Stack(
                children: [
                  Container(
                      height: Get.height,
                      child: CameraPreview(
                        controller.cameraController!,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [crossIcon, options, bottomBar],
                          ),
                        ),
                      )),
                ],
              );
            }
          }),
    );
  }

  //  cross icon
  Widget get crossIcon => Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () {
            Get.to(() => BottomNavBarScreen());
          },
          child: Icon(
            Feather.x,
            color: AppColors.white,
          ),
        ),
      ));

  // column for effects + audio + timer
  Widget get options => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListTile(
              iconColor: AppColors.white,
              textColor: AppColors.white,
              minLeadingWidth: 2,
              leading: const Icon(
                Feather.edit,
              ),
              title: const Text('Effects'),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const AddMusicScreen());
              },
              child: ListTile(
                iconColor: AppColors.white,
                textColor: AppColors.white,
                minLeadingWidth: 2,
                leading: const Icon(Feather.music),
                title: const Text('Audio'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                iconColor: AppColors.white,
                textColor: AppColors.white,
                minLeadingWidth: 2,
                leading: const Icon(Feather.clock),
                title: const Text('Timer'),
              ),
            )
          ],
        ),
      );

  // /* timer */
  // get stopTimer {
  //   Timer(const Duration(seconds: 30), () async {
  //     controller.startRecording;
  //   });
  // }

  // bottom bar
  Widget get bottomBar => Padding(
        padding: const EdgeInsets.all(40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [gallery, cameraButton, flipCamera],
        ),
      );

  // gallery
  Widget get gallery => CommonWidgets.commonContainer(GetBuilder(
      init: CreateVideoController(),
      dispose: (state) {
        if (state.controller != null) {
          state.controller!.cameraController!.dispose();
        }
      },
      builder: (controller) {
        if (!controller.cameraController!.value.isInitialized) {
          return const CircularProgressIndicator();
        }
        return Center(
          child: GestureDetector(
            onTap: () {
              controller.pickVideos;
            },
            child: Icon(
              Icons.image,
              color: AppColors.white,
            ),
          ),
        );
      }));

  // camera button
  Widget get cameraButton => GetBuilder(
      init: CreateVideoController(),
      dispose: (state) {
        if (state.controller != null) {
          state.controller!.cameraController!.dispose();
        }
      },
      builder: (controller) {
        if (!controller.cameraController!.value.isInitialized) {
          return const CircularProgressIndicator();
        }
        return GestureDetector(
          onTap: () {
            controller.startRecording;

            setState(() {
              isProgress = !isProgress;
            
            });
          },
          // check if recording is in progress
          child: isProgress
              ? percentIndicator
              : Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(width: 1.0, color: AppColors.primary),
                      borderRadius: BorderRadius.circular(50)),
                  // adius: BorderRadius.circular(50),
                  child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(50)),
                      )),
                ),
        );
      });

  // recording progress indicator

  Widget get percentIndicator => Obx(() => CircularPercentIndicator(
      progressColor: AppColors.primary,
      backgroundColor: Colors.grey,
      animation: true,
      animateFromLastPercent: true,
      percent: controller.videoRecordPercent.value,
      animationDuration: 1000,
      radius: 50,
      center: playPauseButton));

  Widget get playPauseButton => InkWell(
        onTap: () {
          // If the recording is live then cancel the timer
          // if ( controller.periodicTimer!= null) {
          //   controller.periodicTimer!.cancel();
          // }
          // else {
          //   controller.startRecording;
          // }
          if (controller.videoRecordPercent.value != 0) {
            controller.stopVideoRecording;
          } else {
            controller.startRecording;
          }
        },
        child: CircleAvatar(
          backgroundColor: AppColors.primary,
          radius: 35.0,
        ),
      );

  // flip camera
  Widget get flipCamera => CommonWidgets.commonContainer(GetBuilder(
      init: CreateVideoController(),
      dispose: (state) {
        if (state.controller != null) {
          state.controller!.cameraController!.dispose();
        }
      },
      builder: (controller) {
        if (!controller.cameraController!.value.isInitialized) {
          return const CircularProgressIndicator();
        }
        return Center(
          child: GestureDetector(
            onTap: () {
              controller.toggleCamera;
            },
            child: Icon(
              Icons.flip_camera_android,
              color: AppColors.white,
            ),
          ),
        );
      }));
}
