import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:short_video_app/commons/common.button.dart';
import 'package:short_video_app/model/color.model.dart';

class InterestScreen extends StatelessWidget {
  InterestScreen({super.key});

  /* login form key */
  GlobalKey<FormState> interestsFormKey =
      GlobalKey<FormState>(debugLabel: math.Random().nextInt(10).toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: interestsFormKey,
          child: ListView(
            children: [
              /* appbar row */
              appbarRow,
              /* title */
              title,
              /* subtitle */
              subTitle,
              /* interrest tile */
              interestListTile,
              /* save button */
              saveButton
            ],
          ),
        ),
      ),
    );
  }

  /* appbar row */
  Widget get appbarRow => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /* abck option */
          backOption,
          /* skip button */
          skipButton
        ],
      );

  /* back arrow */
  Widget get backOption => Icon(
        Feather.arrow_left,
        color: AppColors.white,
      );

  /* skip button */
  Widget get skipButton => Text(
        "Skip",
        style: TextStyle(color: AppColors.white, fontSize: 14),
      );

  /* title */
  Widget get title => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Text(
          titleString,
          style: titleStyle,
        ),
      );

  /* title string */
  String titleString = "What are you into?";

  /* title style */
  TextStyle get titleStyle => TextStyle(
      color: AppColors.white, fontSize: 24, fontWeight: FontWeight.w500);

  /* subtitle */
  Widget get subTitle => Text(
        subtitleString,
        style: subTitleStyle,
      );

  /* subtitle detail */
  String subtitleString = "You like what you like, Now, let's everyone know";

  /* title style */
  TextStyle get subTitleStyle => TextStyle(
      color: AppColors.white.withOpacity(0.4), fontSize: 14, height: 1.5);

  /* interest list tile  */
  Widget get interestListTile => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Wrap(
          children: [
            ...List.generate(
                interestLists.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 10),
                      child: Container(
                          decoration: tileDecoration,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              interestLists[index],
                              style: TextStyle(color: AppColors.white),
                            ),
                          )),
                    ))
          ],
        ),
      );

  /* interest tile decoration */
  BoxDecoration get tileDecoration => BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: AppColors.white.withOpacity(0.4)));

  /* save button */
  Widget get saveButton => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: CommonButton(text: "Save", onPressed: () {}),
      );

  /* interest lists */
  List interestLists = [
    "90's Kid",
    "HarryPotter",
    "SoundCloud",
    "Spa",
    "Ludo",
    "House Parties",
    "Maggi",
    "Biryani",
    "Hot Yoga",
    "Meditation",
    "Hockey"
  ];
}
