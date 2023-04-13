import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:short_video_app/model/color.model.dart';
import 'package:short_video_app/model/image.model.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          /* Background video */
          backgroundImage,
          /* Other details */
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              AppColors.white.withOpacity(0.05),
              AppColors.black.withOpacity(0.05),
              // AppColors.black.withOpacity(0.05),
              AppColors.black
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /* User details */
                          userDetails,
                          /* Video description */
                          videoDescription,
                          /* Hashtags */
                          hashtags,
                          // Music name
                          musicDetails
                        ],
                      ),
                    ),
                  ),
                  // Right side options
                  rightSideOptions
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Right side options
  Widget get rightSideOptions => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Number of likes
          rightSideOptionsTile(icon: Icons.favorite, value: "1.2K"),
          // Number of likes
          rightSideOptionsTile(icon: Feather.message_circle, value: "187+"),
          // Number of likes
          rightSideOptionsTile(icon: Icons.bookmark),
          // Number of likes
          rightSideOptionsTile(
            icon: Icons.share_rounded,
          ),
        ],
      );
  // Right side options tile
  Widget rightSideOptionsTile({IconData? icon, String? value}) => Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            ClayContainer(
              height: 45.0,
              width: 45.0,
              borderRadius: 50.0,
              color: AppColors.neumorphicColor,
              curveType: CurveType.concave,
              spread: 2.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 2.0, top: 2.0),
                child: Icon(
                  icon,
                  size: 22.0,
                  color: AppColors.primary.withOpacity(0.6),
                ),
              ),
            ),
            if (value != null)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 2.0),
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: 13.0, color: AppColors.white.withOpacity(0.8)),
                ),
              )
            // else
            //   const Padding(padding: EdgeInsets.only(top: 8.0, left: 2.0))
          ],
        ),
      );
  /* Music details */
  Widget get musicDetails => Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Row(
          children: [musicIcon, musicName],
        ),
      );
  /* Music icon */
  Widget get musicIcon => Icon(
        Feather.music,
        color: AppColors.white,
        size: 14.0,
      );
  /* Music name */
  Widget get musicName => Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: Text(
          "Contrary to popular belief, Lorem Ipsum is...",
          style: musicNameStyle,
        ),
      );
  TextStyle get musicNameStyle =>
      TextStyle(fontSize: 11.0, color: AppColors.white);
  /* Hashtags */
  Widget get hashtags => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          "#dance  #party  #trending",
          style: hashtagsStyle,
        ),
      );
  TextStyle get hashtagsStyle =>
      TextStyle(fontSize: 12.0, color: AppColors.white);
  /* Video description */
  Widget get videoDescription => Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots and all.",
          style: descriptionStyle,
        ),
      );
  TextStyle get descriptionStyle => TextStyle(
      fontSize: 12.0, color: AppColors.white.withOpacity(0.8), height: 1.5);
  /* User details */
  Widget get userDetails => Row(
        children: [userImage, userName],
      );
  /* User name */
  Widget get userName => Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quiche Fresco",
              style: nameStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                "@quicheFres",
                style: userNameStyle,
              ),
            ),
          ],
        ),
      );
  TextStyle get userNameStyle =>
      TextStyle(fontSize: 12.0, color: AppColors.white.withOpacity(0.5));
  TextStyle get nameStyle => TextStyle(fontSize: 14.0, color: AppColors.white);
  /* User image */
  Widget get userImage => ClayContainer(
        height: 50.0,
        width: 50.0,
        borderRadius: 50.0,
        color: AppColors.neumorphicColor,
        curveType: CurveType.concave,
        spread: 2.0,
        child: const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&w=1000&q=80"),
        ),
      );
  /* Background image - This is image for now - This will be video in the next phase */
  Widget get backgroundImage =>
      Image(image: AssetImage(AppImages.backgroundImg), fit: BoxFit.cover);
}
