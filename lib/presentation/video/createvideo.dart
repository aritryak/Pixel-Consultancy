// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:short_video_app/model/bottomnav.model.dart';
import 'package:short_video_app/model/color.model.dart';
import 'package:short_video_app/model/font.model.dart';

class CreateVideo extends StatefulWidget {
  const CreateVideo({
    super.key,
  });

  @override
  State<CreateVideo> createState() => _CreateVideoState();
}

class _CreateVideoState extends State<CreateVideo> {
  ValueNotifier<int> selectedIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/background.png'))),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 300,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Expanded(child: firstSection), middlesection, secondsection],
                    ),
                  ],
                ),
              ),
            )));
  }

  // bottom nav items
  // Bottom navigation bar widget
  Widget get bottomNavBarWidget => ValueListenableBuilder<int>(
      valueListenable: selectedIndex,
      builder: (context, selected, child) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: BottomNavigationBar(
                onTap: (index) {
                  selectedIndex.value = index;
                },
                currentIndex: selected,
                selectedItemColor: AppColors.white,
                // selectedFontSize: 12.0,
                unselectedFontSize: 12.0,
                backgroundColor: Colors.transparent,
                items: List.generate(
                    bottomNavItems.length,
                    (index) => bottomNavigationBarItemTile(
                        bottomNavModel: bottomNavItems[index]))),
          ),
        );
      });

  // Bottom navigation bar item tile
  BottomNavigationBarItem bottomNavigationBarItemTile(
          {BottomNavModel? bottomNavModel}) =>
      BottomNavigationBarItem(
          label: bottomNavModel!.title,
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Icon(
              bottomNavModel.icon,
              size: 20.0,
            ),
          ));

  // row first section
  Widget get firstSection =>
      Container(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/background.png')),
              const SizedBox(
                width: 20,
              ),
              Center(
                child: Text(
                  'Quiche Fresco',
                  style: TextStyle(
                      fontFamily: Fonts.medium,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '“Love is composed of a single soul inhabiting two bodies.” - Aristotle',
            style: TextStyle(
              fontFamily: Fonts.light,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '#dance #party #trending',
            style: TextStyle(
              fontFamily: Fonts.regular,
              color: Colors.white70,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Icon(Feather.music, color: Colors.white,),
              Text(
                '  Contrary to popular..',
                style: TextStyle(
                  fontFamily: Fonts.regular,
                  color: Colors.white70,
                ),
              ),
            ],
          )
        ]),
      );
Widget get middlesection => Container(width: 100,);
// second section...
  Widget get secondsection => Container(
    child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ClayContainer(
                height: 50,
                width: 50,
                //  spread: 10,
                depth: 70,
                borderRadius: 50,
                color: const Color.fromARGB(255, 180, 22, 11),
                curveType: CurveType.convex,
                child: const Center(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ClayContainer(
                height: 50,
                width: 50,
                //  spread: 10,
                depth: 60,
                borderRadius: 50,
                color: const Color.fromARGB(255, 152, 70, 64),
                curveType: CurveType.concave,
                child: const Center(
                  child: Icon(
                    Feather.message_square,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ClayContainer(
                height: 50,
                width: 50,
                //  spread: 10,
                depth: 60,
                borderRadius: 50,
                color: const Color.fromARGB(255, 152, 70, 64),
                curveType: CurveType.concave,
                child: const Center(
                  child: Icon(
                    Feather.bookmark,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ClayContainer(
                height: 50,
                width: 50,
                //  spread: 10,
                depth: 60,
                borderRadius: 50,
                color: const Color.fromARGB(255, 152, 70, 64),
                curveType: CurveType.concave,
                child: const Center(
                  child: Icon(
                    Feather.share_2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
  );
}
