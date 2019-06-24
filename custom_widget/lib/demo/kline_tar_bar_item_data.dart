import 'package:custom_widget/demo/kline_index.dart';
import 'package:custom_widget/utils/adaptive_util.dart';
import 'package:flutter/material.dart';

///K线tab bar指标
class KlineTarBarItemData {
  static const String moreItem = '更多';

  List<String> klineTabBars = <String>[
    KLineIndex.min_Hour_Menu,
    KLineIndex.min_15_Menu,
    KLineIndex.hour_1_Menu,
    KLineIndex.hour_4_Menu,
    KLineIndex.day_1_Menu,
    moreItem,
  ];
  List<String> klineHideTabBars = <String>[
    KLineIndex.min_1_Menu,
    KLineIndex.min_5_Menu,
    KLineIndex.min_30_Menu,
    KLineIndex.week_1_Menu,
    KLineIndex.month_1_Menu,
  ];
  TextStyle moreItemDartTextStyle = TextStyle(
    fontSize: Adaptive.width(11),
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );
  TextStyle moreItemLightTextStyle = TextStyle(
    fontSize: Adaptive.width(13),
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  List<String> pageView = <String>[
    KLineIndex.min_Hour_Menu,
    KLineIndex.min_15_Menu,
    KLineIndex.hour_1_Menu,
    KLineIndex.hour_4_Menu,
    KLineIndex.day_1_Menu,

    KLineIndex.min_1_Menu,
    KLineIndex.min_5_Menu,
    KLineIndex.min_30_Menu,
    KLineIndex.week_1_Menu,
    KLineIndex.month_1_Menu,
  ];

  int getPageViewPosition(String menu){
    return pageView.indexOf(menu);
  }

  String rightTriangle = 'quotation_right_triangle';

  TextStyle _currentMoreStyle;

  set currentMoreStyle(TextStyle textStyle) => _currentMoreStyle = textStyle;

  get currentMoreStyle => _currentMoreStyle ?? moreItemDartTextStyle;

  void updateRightTriangle(bool isShowMore) {
    if (isShowMore) {
      rightTriangle = 'quotation_right_triangle_light';
    } else {
      rightTriangle = 'quotation_right_triangle';
    }
  }
}