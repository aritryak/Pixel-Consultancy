import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:short_video_app/model/color.model.dart';

class CommonWidgets {
  static Widget get circularLoader => Center(
    child: CircularProgressIndicator(
      color: AppColors.primary,
      strokeWidth: 2.0,
    ),
  );

  static Widget commonContainer(child) =>  ClayContainer(
              height: 50.0,
              width: 50.0,
              borderRadius: 50.0,
              color: AppColors.neumorphicColor,
              curveType: CurveType.concave,
              spread: 2.0,
              child:  Padding(
                padding: const EdgeInsets.all(10),
               child: child,
              ),
            );
}