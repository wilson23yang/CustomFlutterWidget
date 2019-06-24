import 'package:custom_widget/demo/kline_tar_bar_item_data.dart';
import 'package:custom_widget/utils/adaptive_util.dart';
import 'package:custom_widget/widget/custom_tabs.dart';
import 'package:flutter/material.dart';

class CustomTabBarDemo extends State with SingleTickerProviderStateMixin{
  KlineTarBarItemData klineBarItemData = KlineTarBarItemData();


  @override
  Widget build(BuildContext context) {
    CustomTabBar ctb = CustomTabBar(
      key: GlobalKey(),
      labelPadding: EdgeInsets.only(
        right: Adaptive.width(20.0),
        bottom: Adaptive.width(5.0),
      ),
      indicatorPadding: EdgeInsets.only(right: Adaptive.width(20.0)),
      indicatorWeight: Adaptive.width(2.0),
      isScrollable: true,
      controller: TabController(
          initialIndex: 0,
          length: 5,vsync: this),
      indicatorSize: CustomTabBarIndicatorSize.tab,
      labelColor: Colors.white,
      indicatorColor: Colors.white,
      unselectedLabelColor: Colors.white,
      labelStyle:
      TextStyle(fontSize: Adaptive.font(13), fontWeight: FontWeight.normal),
      unselectedLabelStyle: TextStyle(fontSize: Adaptive.font(11)),
      tabs: List.generate(klineBarItemData.klineTabBars.length, (int index) {
        if (index < 5) {
          return Text(klineBarItemData.klineTabBars[index] ?? '');
        } else {
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                '${klineBarItemData.klineTabBars[index]}',
                style: klineBarItemData.klineTabBars[index] ==
                    KlineTarBarItemData.moreItem
                    ? klineBarItemData.currentMoreStyle
                    : klineBarItemData.moreItemLightTextStyle,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: Adaptive.width(2)),
                child: Image.asset(klineBarItemData.rightTriangle),
              ),
            ],
          );
        }
      }).toList(),
      tapIntercept: (int index) {
        if (index < 5) {
          klineBarItemData
              .klineTabBars[klineBarItemData.klineTabBars.length - 1] =
              KlineTarBarItemData.moreItem;
          klineBarItemData.currentMoreStyle =
              klineBarItemData.moreItemDartTextStyle;
          setState(() {});
          return true;
        } else {
          if (klineBarItemData.klineTabBars[index] ==
              KlineTarBarItemData.moreItem) {
            klineBarItemData.currentMoreStyle =
                klineBarItemData.moreItemLightTextStyle;
            setState(() {});
            //showKlineHideItemBar();
            return false;
          } else {
            //showKlineHideItemBar();
            return true;
          }
        }
      },
    );
    return null;
  }
}
