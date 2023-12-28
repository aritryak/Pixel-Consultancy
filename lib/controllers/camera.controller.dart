import 'dart:developer';
import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CreateVideoController extends GetxController {
   CameraController? cameraController;
  late List<CameraDescription> cameras;

  @override
  void onInit() {
    super.onInit();
    camerasAvailable;
  }

  void get camerasAvailable async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras[0], ResolutionPreset.max);
    try {
      await cameraController!.initialize();
      update();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void dispose() {
    cameraController!.dispose();
    super.dispose();
  }
}
