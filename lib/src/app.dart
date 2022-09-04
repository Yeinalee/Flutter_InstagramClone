import 'package:flutter/material.dart';
import 'package:flutter_insta/src/components/image_data.dart';
import 'package:flutter_insta/src/controller/bottom_nav_controller.dart';
import 'package:flutter_insta/src/pages/active_history.dart';
import 'package:flutter_insta/src/pages/home.dart';
import 'package:flutter_insta/src/pages/mypage.dart';
import 'package:get/get.dart';

import 'pages/search.dart';

//버튼 네비게이션
//인덱스드 스택
//뒤로가기 버튼 관리

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // ignore: sort_child_properties_last
      child: Obx(
        () => Scaffold(
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              const Home(),
              Navigator(
                key: controller.searchPageNaviationKey,
                onGenerateRoute: (routeSetting) {
                  return MaterialPageRoute(
                    builder: (context) => const Search(),
                  );
                },
              ),
              const Search(),
              //Container(),
              const ActiveHistory(),
              const Mypage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed, //activeIcon이 위로 올라가지 않게
            showSelectedLabels: false, //라벨 없애기
            showUnselectedLabels: false,
            currentIndex: controller.pageIndex.value,
            elevation: 0,
            onTap: controller.changeBottomNav,
            items: [
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.homeOff),
                activeIcon: ImageData(IconsPath.homeOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.searchOff),
                activeIcon: ImageData(IconsPath.searchOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.uploadIcon),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.activeOff),
                activeIcon: ImageData(IconsPath.activeOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                label: 'home',
              ),
            ],
          ),
        ),
      ),
      onWillPop: controller.willPopAction,
      //뒤로가기버튼 누르면 onWillpop 함수 실행
    );
  }
}
