// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:short_video_app/model/color.model.dart';
import 'package:short_video_app/model/font.model.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List videoLists = [
    'assets/pexels-the-world-hopper-1851481.png',
    'assets/pexels-motional-studio-1081685 1.png',
    'assets/pexels-the-world-hopper-1851481.png',
    'assets/pexels-the-world-hopper-1851481.png',
    'assets/pexels-motional-studio-1081685 1.png',
    'assets/pexels-the-world-hopper-1851481.png',
    'assets/pexels-the-world-hopper-1851481.png',
    'assets/pexels-motional-studio-1081685 1.png',
    'assets/pexels-the-world-hopper-1851481.png',
    'assets/pexels-the-world-hopper-1851481.png',
    'assets/pexels-motional-studio-1081685 1.png',
    'assets/pexels-the-world-hopper-1851481.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListView(children: [profile, followList, videoList]),
      ),
    );
  }

// profile details
  Widget get profile => Center(
        child: Column(
          children: [profileImage, name, userId, edit],
        ),
      );

// profile heading
  Widget get heading => Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Text(
          'Profile',
          style: TextStyle(
            fontSize: 18,
            color: AppColors.white,
          ),
        ),
      );

// profile image
  Widget get profileImage => CircleAvatar(
        radius: 50,
        backgroundImage: const AssetImage('assets/trendingpage/Group62.png'),
        child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: const Image(
                    height: 25, image: AssetImage('assets/Vector.png')))),
      );

// name
  Widget get name => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Srmkty Pally',
          style: TextStyle(
              fontSize: 20,
              color: AppColors.white,
              fontWeight: FontWeight.bold),
        ),
      );

// occupation
  Widget get userId => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          '@srmktypally',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.white,
          ),
        ),
      );

// edit button + setting
  Widget get edit => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [editButton, setting],
      );

  // edit button
  Widget get editButton => ClayContainer(
        // surfaceColor: ,
        spread: 1,
        borderRadius: 5,
        color: AppColors.background,
        surfaceColor: AppColors.primary,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 30),
                backgroundColor: AppColors.primary,
                elevation: 0.0),
            onPressed: () {},
            child: Text(
              'Edit Profile',
              style: TextStyle(fontSize: 20, fontFamily: Fonts.regular
                  // fontWeight: FontWeight.regular,
                  ),
            )),
      );

  // setting
  Widget get setting => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClayContainer(
          spread: 1,
          color: AppColors.background,
          borderRadius: 10,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(50, 30),
                elevation: 0.0,
                backgroundColor: AppColors.background,
              ),
              onPressed: () {},
              child: Icon(Feather.settings, size: 24, color: AppColors.white)),
        ),
      );

  // followers + following + videos
  Widget get followList => Padding(
        padding: const EdgeInsets.all(20),
        child: ClayContainer(
          borderRadius: 5,
          depth: 10,
          spread: 1,
          height: 70,
          color: AppColors.background,
          surfaceColor: AppColors.background,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                followers,
                VerticalDivider(
                  color: AppColors.white,
                ),
                followings,
                VerticalDivider(
                  color: AppColors.white,
                ),
                videos
              ],
            ),
          ),
        ),
      );

  // followers
  Widget get followers => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '150k',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.white,
              ),
            ),
            Text(
              'followers',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.white,
              ),
            )
          ],
        ),
      );

  // followers
  Widget get followings => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '300',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.white,
              ),
            ),
            Text(
              'followings',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.white,
              ),
            )
          ],
        ),
      );

  // followers
  Widget get videos => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '840',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.white,
              ),
            ),
            Text('videos',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.white,
                ))
          ],
        ),
      );

  // video lists
  Widget get videoList => Padding(
        padding: const EdgeInsets.all(1.0),
        child: GridView.count(
          childAspectRatio: 1 / 1.5,
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(videoLists.length,
              (index) => videoListTile(image: videoLists[index])),
        ),
      );

  // Separated video tile
  Widget videoListTile({required String image}) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  opacity: 0.6,
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                gradient: LinearGradient(colors: [
                  AppColors.white.withOpacity(0.05),
                  AppColors.black.withOpacity(0.05),
                  AppColors.black
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            constraints: const BoxConstraints(minHeight: 300, minWidth: 100),
            child: Align(alignment: Alignment.bottomLeft, child: videoView)),
      );

  // video view
  Widget get videoView => ListTile(
        minLeadingWidth: 1,
        horizontalTitleGap: 5,
        contentPadding: const EdgeInsets.only(left: 10),
        leading: Icon(
          Feather.play_circle,
          size: 18,
          color: AppColors.white,
        ),
        title: Text(
          '3M',
          style: TextStyle(color: AppColors.white),
        ),
      );
}
