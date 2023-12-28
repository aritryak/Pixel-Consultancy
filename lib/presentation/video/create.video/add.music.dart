import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:short_video_app/controllers/createvideo.controller.dart';
import 'package:short_video_app/model/audio.model.dart';
import 'package:short_video_app/model/color.model.dart';
import 'package:short_video_app/presentation/video/create.video/create.video.screen.dart';

import '../../../model/font.model.dart';

class AddMusicScreen extends StatefulWidget {
  const AddMusicScreen({super.key});

  @override
  State<AddMusicScreen> createState() => _AddMusicScreenState();
}

class _AddMusicScreenState extends State<AddMusicScreen> {
  final audio = AudioPlayer();
  final controller = Get.put(CreateVideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: List.generate(audioLists.length, (position) {
              return Column(
                children: [
                  ListTile(
                    leading: Image(
                        image: AssetImage(audioLists[position].audioImageUrl!)),
                    // title: ,
                    title: Text(
                      audioLists[position].audioTitle!,
                      style: TextStyle(
                          fontFamily: Fonts.medium, color: AppColors.white),
                    ),
                    trailing: GestureDetector(
                      onTap: () async {
                        String audioUrl = audioLists[position].audioUrl!;
                        TrendingAudioModel currentModel = audioLists[position];
                        

                        log(controller.selected.value.toString());
                        for (var index = 0;
                            index < audioLists.length;
                            index++) {
                          if (position == index) {
                            controller.selected.value =
                            audioLists[index].audioUrl.toString();
                            if (currentModel.isPlaying) {
                              await audio.pause();
                            } else {
                              await audio.play(UrlSource(audioUrl));
                            }
                            currentModel.isPlaying = !currentModel.isPlaying;
                            setState(() {
                              Get.to(() => const CreateVideoScreen());
                            });
                          } else {
                            // await audio.pause();
                            audioLists[index].isPlaying = false;
                            setState(() {});
                          }
                        }
                      },
                      child: !audioLists[position].isPlaying
                          // child: isPlaying
                          ? Icon(
                              Feather.play,
                              color: AppColors.white,
                              size: 20,
                            )
                          : Icon(
                              Feather.pause,
                              color: AppColors.white,
                              size: 20,
                            ),
                    ),
                  ),
                  const Divider()
                ],
              );
            }),
          ),
        ));
  }
}
