import 'package:clay_containers/clay_containers.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:short_video_app/commons/common.vars.dart';
import 'package:short_video_app/model/bottomnav.model.dart';
import 'package:short_video_app/model/color.model.dart';
import 'package:short_video_app/presentation/video/dashboard/dashboard.dart';

class BottomNavBarScreen extends StatelessWidget {
  BottomNavBarScreen({super.key});
  
  final screens = [
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dashboard(),
      bottomNavigationBar: bottomNavBarWidget,
    );
  }

  /* Bottom navigation bar widget */
  Widget get bottomNavBarWidget =>
      StatefulBuilder(builder: (context, setState) {
        return Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: AppColors.neumorphicColor,
          ),
          child: ValueListenableBuilder<int>(
              valueListenable: selectedIndex,
              builder: (context, selected, child) {
                return BottomNavigationBar(
                    onTap: (index) {
                      selectedIndex.value = index;
                    },
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    currentIndex: selected,
                    selectedItemColor: AppColors.primary.withOpacity(0.7),
                    unselectedItemColor: AppColors.white.withOpacity(0.2),
                    type: BottomNavigationBarType.fixed,
                    items: List.generate(
                        bottomNavItems.length,
                        (index) => bottomNavBarItemTile(
                            item: bottomNavItems[index], index: index)));
              }),
        );
      });
  /* Bottom navigation bar item tile */
  BottomNavigationBarItem bottomNavBarItemTile(
          {BottomNavModel? item, int? index}) =>
      BottomNavigationBarItem(
          icon: bottomNavIcon(icon: item!.icon, index: index),
          label: item.title ?? "");
  /* Bottom navigation bar icon widget */
  Widget bottomNavIcon({IconData? icon, int? index}) =>
      neumorphicIcon(icon: icon, index: index);
  /* Neumorphic bottom nav icon */
  Widget neumorphicIcon({IconData? icon, int? index}) =>
      ValueListenableBuilder<int>(
          valueListenable: selectedIndex,
          builder: (context, selected, child) {
            return ClayContainer(
              height: 50.0,
              width: 50.0,
              borderRadius: 50.0,
              curveType:
                  selected == index ? CurveType.concave : CurveType.convex,
              color: AppColors.neumorphicColor,
              child: Icon(
                icon,
                size: icon == Feather.plus ? 25.0 : 22.0,
              ),
            );
          });
}
