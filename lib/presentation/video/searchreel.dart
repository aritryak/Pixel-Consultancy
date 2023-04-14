// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, must_be_immutable

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:short_video_app/model/color.model.dart';
import 'package:short_video_app/model/font.model.dart';

class SearchReel extends StatefulWidget {
  const SearchReel({super.key});

  @override
  State<SearchReel> createState() => _SearchReelState();
}

class _SearchReelState extends State<SearchReel> {
  List newVideo = [
    'assets/mask-group.png',
    'assets/mask-group.png',
  ];

  List fashionVideo = [
    'assets/pexels-the-world-hopper-1851481.png',
    'assets/pexels-motional-studio-1081685 1.png',
    'assets/pexels-the-world-hopper-1851481.png',
  ];

  List comedyVideo = [
    'assets/pexels-spencer-davis-4388168 1.png',
    'assets/pexels-spencer-davis-4388168 1.png',
    'assets/pexels-mikhail-nilov-7705975 1.png',
  ];

  List travelVideo = [
    'assets/pexels-the-world-hopper-1851481.png',
    'assets/pexels-spencer-davis-4388168 1.png',
    'assets/pexels-spencer-davis-4388168 1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        toolbarHeight: 100,
        flexibleSpace: Container(height: 100,),
        elevation: 0.0,
        backgroundColor: AppColors.background,
        bottom:  PreferredSize(preferredSize: const Size(double.infinity, 20),child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: searchBox,
        ),)
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                seeNew,
                newVideos,
                fashion,
                fashionVideos,
                comedy,
                comedyVideos,
                travel,
                travelVideos
              ],
            ),
          ),
        ),
      ),
    );
  }

// search text field
  Widget get searchBox => ClayContainer(
      color: AppColors.background,
      surfaceColor: AppColors.background,
      // emboss: true,
      borderRadius: 50,
      depth: 10,
      spread: 1,
      curveType: CurveType.none,
      child: TextFormField(
        style: const TextStyle(color: Colors.white70),
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Feather.search,
                color: AppColors.white,
              )),
          hintText: 'Type here...',
          hintStyle: TextStyle(
              color: AppColors.white, fontFamily: Fonts.regular),
        ),
      ));

  // what's new option
  Widget get seeNew => Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "What's new!",
              style: TextStyle(color: AppColors.white, fontFamily: Fonts.light),
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

  // new video
  Widget get newVideos => Container(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: newVideo.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image(
              image: AssetImage(newVideo[index]),
              fit: BoxFit.cover,
              width: 200,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 10,
        ),
      ));

  // fashion
  Widget get fashion => Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '#fashion',
              style: TextStyle(color: AppColors.white, fontFamily: Fonts.light),
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

  // fashion video
  Widget get fashionVideos => Container(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: fashionVideo.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image(
              image: AssetImage(fashionVideo[index]),
              fit: BoxFit.cover,
              height: 120,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 15,
        ),
      ));

  // comedy
  Widget get comedy => Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '#comedy',
              style: TextStyle(color: AppColors.white, fontFamily: Fonts.light),
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

  // comedy video
  Widget get comedyVideos => Container(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: comedyVideo.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image(
              image: AssetImage(comedyVideo[index]),
              fit: BoxFit.cover,
              height: 120,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 15,
        ),
      ));

  // travel
  Widget get travel => Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '#travel',
              style: TextStyle(color: AppColors.white, fontFamily: Fonts.light),
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

  // travel video
  Widget get travelVideos => Container(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: travelVideo.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              child: Image(
                image: AssetImage(travelVideo[index]),
                fit: BoxFit.cover,
                height: 120,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 15,
        ),
      ));
}
