import 'package:camera/camera.dart';
import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:short_video_app/controllers/camera.controller.dart';
import '../../../commons/common.widgets.dart';
import '../../../model/color.model.dart';

class CreateVideoScreen extends StatelessWidget {
  const CreateVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CreateVideoController>(
        init: CreateVideoController(),
        builder: (controller) {
          if (controller.cameraController != null &&
              controller.cameraController!.value.isInitialized) {
            return Column(
              children: [
                Expanded(
                    child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // CameraPreview(controller.cameraController!),
                    Container(
                      height: Get.height,
                      width: Get.width,
                      color: AppColors.neumorphicColor,
                    ),
                    stackedOptions
                  ],
                )),
              ],
            );
          } else {
            return Container(
                color: AppColors.neumorphicColor,
                child: CommonWidgets.circularLoader);
          }
        },
      ),
    );
  }

  Widget get stackedOptions => Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(mainAxisAlignment: MainAxisAlignment.end,
          children: [bottomIcons],
        ),
  );
  // Bottom icons
  Widget get bottomIcons => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [galleryIcon],
      );

  // Galley icon
  Widget get galleryIcon =>
      commonNeumorphic(child: Icon(Feather.image, color: AppColors.white));
  // Camera icon
  Widget get rotateCameraIcon =>
      commonNeumorphic(child: Icon(Feather.image, color: AppColors.white));

  // Common neumorphic
  Widget commonNeumorphic({Widget? child}) => ClayContainer(
      height: 50.0,
      width: 50.0,
      borderRadius: 50.0,
      color: AppColors.neumorphicColor,
      curveType: CurveType.concave,
      spread: 2.0,
      child: CircleAvatar(
        backgroundColor: AppColors.neumorphicColor,
        child: child,
      ));
}
