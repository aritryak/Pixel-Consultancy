// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:short_video_app/model/audio.model.dart';
import 'package:short_video_app/model/color.model.dart';
import 'package:short_video_app/model/creator.model.dart';
import 'package:short_video_app/model/font.model.dart';

class TrendingVideo extends StatefulWidget {
  const TrendingVideo({super.key});

  @override
  State<TrendingVideo> createState() => _TrendingVideoState();
}

class _TrendingVideoState extends State<TrendingVideo> {
  final audio = AudioPlayer();
  List trendingVideoLists = [
    'assets/pexels-the-world-hopper-1851481.png',
    'assets/pexels-motional-studio-1081685 1.png',
    'assets/pexels-the-world-hopper-1851481.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Trending'),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                trendingAudiio,
                audioList,
                trendingVideo,
                trendingVideoList,
                popularCreator,
                popularCreatorList
              ],
            ),
          ),
        ),
      ),
    );
  }

// see all trending
  Widget get trendingAudiio => Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Audio",
              style: TextStyle(
                  color: AppColors.white,
                  fontFamily: Fonts.medium,
                  fontSize: 22),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'See All',
                style: TextStyle(
                    color: AppColors.primary,
                    fontFamily: Fonts.regular,
                    fontWeight: FontWeight.bold),
              )
            ])),
          ],
        ),
      );

// audio list

  Widget get audioList => Column(
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
                    for (var index = 0; index < audioLists.length; index++) {
                      if (position == index) {
                        if (currentModel.isPlaying) {
                          await audio.pause();
                        } else {
                          await audio.play(UrlSource(audioUrl));
                        }
                        currentModel.isPlaying = !currentModel.isPlaying;
                        setState(() {});
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
      );

// trending video
  Widget get trendingVideo => Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Video",
              style: TextStyle(
                  color: AppColors.white,
                  fontFamily: Fonts.medium,
                  fontSize: 20),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'See All',
                style: TextStyle(
                    color: AppColors.primary,
                    fontFamily: Fonts.regular,
                    fontWeight: FontWeight.bold),
              )
            ])),
          ],
        ),
      );

  // trending video list
  Widget get trendingVideoList => Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: trendingVideoLists.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage(trendingVideoLists[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:
                      Align(alignment: Alignment.bottomLeft, child: videoView),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 10,
              ),
            )),
      );

  // popular creator
  Widget get popularCreator => Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Popular creator",
              style: TextStyle(
                  color: AppColors.white,
                  fontFamily: Fonts.medium,
                  fontSize: 20),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'See All',
                style: TextStyle(
                    color: AppColors.primary,
                    fontFamily: Fonts.regular,
                    fontWeight: FontWeight.bold),
              )
            ])),
          ],
        ),
      );

  // popular creator list
  Widget get popularCreatorList => Column(
          children: List.generate(creatorList.length, (index) {
        return Column(
          children: [
            ListTile(
                leading: Image(
                    image: AssetImage(creatorList[index].creatorImageUrl!)),
                // title: ,
                title: Text(
                  creatorList[index].creatorTitle!,
                  style: TextStyle(
                      fontFamily: Fonts.medium, color: AppColors.white),
                ),
                trailing: followButton),
            const Divider()
          ],
        );
      }));

// follow button
  Widget get followButton => ElevatedButton(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(100, 40),
          backgroundColor: AppColors.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      onPressed: () {},
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Follow'),
      ));

// video view
  Widget get videoView =>  Padding(
    padding: const EdgeInsets.all(6.0),
    child: Row(
          children: [
            Icon(
              Feather.play,
              size: 20,
              color: AppColors.white.withOpacity(0.8),
            ),
            Text('3M', style: TextStyle(color: AppColors.white.withOpacity(0.8)),),
          ],
        ),
  );
}
