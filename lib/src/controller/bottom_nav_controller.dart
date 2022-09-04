import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_insta/src/pages/upload.dart';
import 'package:get/get.dart';

import '../components/message_popup.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  static BottomNavController get to => Get.find();
  RxInt pageIndex = 0.obs;
  GlobalKey<NavigatorState> searchPageNaviationKey =
      GlobalKey<NavigatorState>();
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];

    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => const Upload());
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _ChangePage(value, hasGesture: hasGesture);
        break;
    }
  }

  //뒤로가기 버튼에서 이용하기 위해 방문한 페이지 리스트에 저장
  void _ChangePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.last != value) {
      //같은 메뉴에 바로 다시 방문하면 적재X
      bottomHistory.add(value);
    }
  }

  Future<bool> willPopAction() async {
    //뒤로가기 처리
    if (bottomHistory.length == 1) {
      showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
          message: '종료하시겠습니까?',
          okCallback: () {
            exit(0);
          },
          cancelCallback: Get.back,
          title: '시스템',
        ),
      );
      //print('exit!');
      return true;
    } else {
      var page = PageName.values[bottomHistory.last];
      if (page == PageName.SEARCH) {
        var value = await searchPageNaviationKey.currentState!
            .maybePop(); //pop할 것이 있는지 확인
        if (value) return false; //pop할 게 없으면 아무 행동도 하지 않음
      }
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      return false;
    }
  }
}
