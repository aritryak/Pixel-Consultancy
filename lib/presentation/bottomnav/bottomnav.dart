
  // // Bottom navigation bar widget
  // Widget get bottomNavBarWidget => ValueListenableBuilder<int>(
  //     valueListenable: selectedIndex,
  //     builder: (context, selected, child) {
  //       return Padding(
  //         padding: const EdgeInsets.all(10.0),
  //         child: ClipRRect(
  //           borderRadius: BorderRadius.circular(15.0),
  //           child: BottomNavigationBar(
  //               onTap: (index) {
  //                 selectedIndex.value = index;
  //               },
  //               currentIndex: selected,
  //               selectedItemColor: AppColors.white,
  //               // selectedFontSize: 12.0,
  //               unselectedFontSize: 12.0,
  //               backgroundColor: Colors.transparent,
  //               items: List.generate(
  //                   bottomNavItems.length,
  //                   (index) => bottomNavigationBarItemTile(
  //                       bottomNavModel: bottomNavItems[index]))),
  //         ),
  //       );
  //     });

  // // Bottom navigation bar item tile
  // BottomNavigationBarItem bottomNavigationBarItemTile(
  //         {BottomNavModel? bottomNavModel}) =>
  //     BottomNavigationBarItem(
  //         label: bottomNavModel!.title,
  //         icon: Padding(
  //           padding: const EdgeInsets.only(bottom: 4.0),
  //           child: Icon(
  //             bottomNavModel.icon,
  //             size: 20.0,
  //           ),
  //         ));