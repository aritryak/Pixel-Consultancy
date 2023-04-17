import 'package:flutter/material.dart';
import 'package:short_video_app/model/color.model.dart';

class CommonWidgets {
  static Widget get circularLoader => Center(
    child: CircularProgressIndicator(
      color: AppColors.primary,
      strokeWidth: 2.0,
    ),
  );
}